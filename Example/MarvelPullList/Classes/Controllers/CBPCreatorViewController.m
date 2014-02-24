//
//  CBPCreatorViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPCreatorViewController.h"
#import "CBPComicViewController.h"

#import "MDACreatorSummary.h"
#import "MDACreator.h"
#import "MDAComicSummary.h"
#import "MDAComicList.h"

@interface CBPCreatorViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) MDACreator* creator;
@property (strong, nonatomic) MDACreatorSummary* creatorSummary;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *sections;
@end

@implementation CBPCreatorViewController

- (id)initWithCreatorSummary:(MDACreatorSummary *)creatorSummary
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        _creatorSummary = creatorSummary;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self loadCreator];
}

#pragma mark -
- (void)loadCreatorView
{
    [self loadSections:self.creator];
    
    [self.tableView reloadData];
}

- (void)loadCreator
{
    __weak typeof(self) blockSelf = self;
    
    [NSURLSessionDataTask fetchCreatorWithId:[self.creatorSummary resourceId]
                                withBlock:^(MDACreator *creator, NSError *error) {
                                    blockSelf.creator = creator;
                                    
                                    [blockSelf loadCreatorView];
                                    
                                }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sections count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatorItemCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CreatorItemCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    MDASummary *item = self.sections[indexPath.section][@"items"][indexPath.row];
    
    cell.textLabel.text = item.name;
    
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
    
    if ([item isKindOfClass:[MDAComicSummary class]]) {
        vc = [[CBPComicViewController alloc] initWithComicSummary:(MDAComicSummary *)item];
    }
    
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
