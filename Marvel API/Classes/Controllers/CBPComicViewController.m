//
//  CBPComicViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "UIImageView+AFNetworking.h"

#import "CBPComicViewController.h"
#import "CBPCreatorViewController.h"
#import "CBPSeriesViewController.h"

#import "MDAComic.h"
#import "MDAComicSummary.h"
#import "MDACreatorList.h"
#import "MDACreatorSummary.h"
#import "MDAImage.h"
#import "MDASummary.h"
#import "MDASeriesSummary.h"

@interface CBPComicViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) MDAComic *comic;
@property (strong, nonatomic) MDAComicSummary *comicSummary;
@property (strong, nonatomic) UITextView *description;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *tableHeaderView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) NSArray *sections;

@end

@implementation CBPComicViewController

- (id)initWithComic:(MDAComic *)comic
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        _comic = comic;
    }
    return self;
}

- (id)initWithComicSummary:(MDAComicSummary *)comicSummary
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        _comicSummary = comicSummary;
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.tableView];
    
    self.tableHeaderView = [UIView new];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default"]];
    self.imageView.frame = CGRectMake(23.0f, 10.0f, 270.0f, 200.0f);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.tableHeaderView addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 220.0f, 290.0f, 0)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.tableView.frame) - 30.0f;
    
    [self.tableHeaderView addSubview:self.titleLabel];
    
    self.description = [[UITextView alloc] initWithFrame:CGRectMake(15.0f, 242.0f, 290.0f, 0)];
    self.description.editable = NO;
    self.description.scrollEnabled = NO;
    self.description.contentInset = UIEdgeInsetsMake(0, 15.0f, 0, 10.0f);
    
    [self.tableHeaderView addSubview:self.description];
    
    self.tableHeaderView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 10 + 200 + 10 + CGRectGetHeight(self.titleLabel.frame) + 10);
    
    self.tableView.tableHeaderView = self.tableHeaderView;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    if (self.comic) {
        [self loadComicView];
    }
    
    [self loadComic];
}

- (void)loadComicView
{
    [self setupHeaderView];
    
    NSMutableArray *sections = @[].mutableCopy;
    NSInteger count = 0;
    
    if (self.comic.creators.available) {
        sections[count] = @{@"items": self.comic.creators.items, @"title": @"Creators"};
        
        count++;
    }
    
    if (self.comic.series) {
        sections[count] = @{@"items": @[self.comic.series], @"title": @"Series"};
        
        count++;
    }
    
    self.sections = sections;
    
    [self.tableView reloadData];
}

- (void)loadComic
{
    __weak typeof(self) blockSelf = self;
    
    NSInteger comicId = (self.comic) ? self.comic.comicId : [self.comicSummary resourceId];
    
    [NSURLSessionDataTask fetchComicWithId:comicId
                                withBlock:^(MDAComic *comic, NSError *error) {
                                    blockSelf.comic = comic;
                                    
                                    [blockSelf loadComicView];
        
    }];
}

#pragma mark -
- (void)setupHeaderView
{
    [self.imageView setImageWithURL:[self.comic.thumbnail imageForResolution:MDAImageResolutionLandscapeXlarge]
                   placeholderImage:[UIImage imageNamed:@"comic-detail-default"]];
    
    self.titleLabel.text = self.comic.title;
    
    [self.titleLabel sizeToFit];

    self.description.text = self.comic.descriptionText;
    
    self.description.frame = CGRectMake(0, 10 + 200 + 10 + CGRectGetHeight(self.titleLabel.frame) + 10, CGRectGetWidth(self.tableView.frame), 0);
    
    [self.description sizeToFit];
    
    self.tableHeaderView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 10 + 200 + 10 + CGRectGetHeight(self.titleLabel.frame) + 10 + CGRectGetHeight(self.description.frame) + 10);
    
    self.tableView.tableHeaderView = self.tableHeaderView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sections count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComicItemCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ComicItemCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    MDASummary *item = self.sections[indexPath.section][@"items"][indexPath.row];
    
    cell.textLabel.text = item.name;
    
    if ([item isKindOfClass:[MDACreatorSummary class]]) {
        cell.detailTextLabel.text = ((MDACreatorSummary *)item).role;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sections[section][@"items"] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sections[section][@"title"];
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    
    UIViewController *vc = nil;
    MDASummary *item = self.sections[indexPath.section][@"items"][indexPath.row];
    
    if ([item isKindOfClass:[MDACreatorSummary class]]) {
        vc = [[CBPCreatorViewController alloc] initWithCreatorSummary:(MDACreatorSummary *)item];
    } else if ([item isKindOfClass:[MDASeriesSummary class]]) {
        vc = [[CBPSeriesViewController alloc] initWithSeriesSummary:(MDASeriesSummary *)item];
    }
    
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
