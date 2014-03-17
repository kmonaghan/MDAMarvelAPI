//
//  CBPTableViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 13/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "PBWebViewController.h"

#import "CBPTableViewController.h"

#import "CBPCharacterViewController.h"
#import "CBPComicViewController.h"
#import "CBPCreatorViewController.h"
#import "CBPEventViewController.h"
#import "CBPSeriesViewController.h"
#import "CBPStoryViewController.h"

#import "MDAComicSummary.h"
#import "MDACharacterList.h"
#import "MDACharacterSummary.h"
#import "MDAComicList.h"
#import "MDACreatorList.h"
#import "MDACreatorSummary.h"
#import "MDAEventList.h"
#import "MDAEventSummary.h"
#import "MDAObject.h"
#import "MDASeriesList.h"
#import "MDASeriesSummary.h"
#import "MDAStoryList.h"
#import "MDAStorySummary.h"
#import "MDASummary.h"

@interface CBPTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *sections;
@end

@implementation CBPTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    UIView *attributionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44.0f)];
    attributionView.backgroundColor = [UIColor lightGrayColor];
    
    self.attributionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 0, CGRectGetHeight(self.view.frame) - 30.0f, CGRectGetHeight(attributionView.frame))];
    self.attributionLabel.textColor = [UIColor blackColor];
    self.attributionLabel.font = [UIFont systemFontOfSize:15.0f];
    self.attributionLabel.text = @"Data provided by Marvel. \u00a9 2014 MARVEL";

    [attributionView addSubview:self.attributionLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = self.attributionLabel.frame;
    [button addTarget:self action:@selector(openAttribution) forControlEvents:UIControlEventTouchUpInside];
    
    [attributionView addSubview:button];
        
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.tableView.tableFooterView = attributionView;
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)loadSections:(MDAObject *)object
{
    NSMutableArray *sections = @[].mutableCopy;
    NSInteger count = 0;

    if (object.characters.available) {
        sections[count] = @{@"items": object.characters.items, @"title": @"Characters"};
        
        count++;
    }
    
    if (object.comics.available) {
        sections[count] = @{@"items": object.comics.items, @"title": @"Comics"};
        
        count++;
    }
    
    if (object.creators.available) {
        sections[count] = @{@"items": object.creators.items, @"title": @"Creators"};
        
        count++;
    }
    
    if (object.events.available) {
        sections[count] = @{@"items": object.events.items, @"title": @"Events"};
        
        count++;
    }
    
    if (object.series) {
        sections[count] = @{@"items": @[object.series], @"title": @"Series"};
        
        count++;
    } else if (object.seriesList.available) {
        sections[count] = @{@"items": object.seriesList.items, @"title": @"Series"};
        
        count++;
    }
    
    if (object.stories) {
        sections[count] = @{@"items": object.stories.items, @"title": @"Stories"};
        
        count++;
    }
    
    if ([object.variants count]) {
        sections[count] = @{@"items": object.variants, @"title": @"Variants"};
        
        count++;
    }
    
    self.sections = sections;
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
    } else if ([item isKindOfClass:[MDAComicSummary class]]) {
        cell.detailTextLabel.text = ((MDAComicSummary *)item).type;
    } else if ([item isKindOfClass:[MDAStorySummary class]]) {
        cell.detailTextLabel.text = ((MDAStorySummary *)item).type;
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
    } else if ([item isKindOfClass:[MDAComicSummary class]]) {
        vc = [[CBPComicViewController alloc] initWithComicSummary:(MDAComicSummary *)item];
    } else if ([item isKindOfClass:[MDAEventSummary class]]) {
        vc = [[CBPEventViewController alloc] initWithEventSummary:(MDAEventSummary *)item];
    } else if ([item isKindOfClass:[MDASeriesSummary class]]) {
        vc = [[CBPSeriesViewController alloc] initWithSeriesSummary:(MDASeriesSummary *)item];
    } else if ([item isKindOfClass:[MDAStorySummary class]]) {
        vc = [[CBPStoryViewController alloc] initWithStorySummary:(MDAStorySummary *)item];
    }
    
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - 
- (void)openAttribution
{
    PBWebViewController *webViewController = [[PBWebViewController alloc] init];
    webViewController.URL = (self.attributionURL) ? [NSURL URLWithString:self.attributionURL] : [NSURL URLWithString:@"http://www.marvel.com"];
    
    [self.navigationController pushViewController:webViewController animated:YES];
}
@end
