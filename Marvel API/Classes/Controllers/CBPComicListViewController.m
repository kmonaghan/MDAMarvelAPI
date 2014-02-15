//
//  CBPComicListViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPBarCodeViewController.h"
#import "CBPComicListViewController.h"
#import "CBPComicViewController.h"

#import "UIImageView+AFNetworking.h"

#import "MDAComic.h"
#import "MDAComicDataWrapper.h"
#import "MDAComicDataContainer.h"
#import "MDAImage.h"
#import "MDASearchParameters.h"

@interface CBPComicListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *comics;
@property (strong, nonatomic) MDASearchParameters *search;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@end

@implementation CBPComicListViewController
- (instancetype)initWithComics:(NSArray *)comics
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        _comics = comics;
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[NSLocalizedString(@"Last Week", nil), NSLocalizedString(@"This Week", nil), NSLocalizedString(@"Next Week", nil)]];
    self.segmentedControl.selectedSegmentIndex = 1;
    [self.segmentedControl addTarget:self action:@selector(searchChanged:) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.segmentedControl];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    
    NSDictionary *views = @{@"segmentedControl": self.segmentedControl,
                            @"tableView": self.tableView};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView][segmentedControl]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[tableView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.segmentedControl
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (!self.comics) {
        self.search = [MDASearchParameters new];
        self.search.dateDescriptor = @"thisWeek";
        self.search.limit = 100;
    
        [self reload];
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                                          target:self
                                                                                          action:@selector(barcodeAction)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Reload", nil)
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(reload)];
}

#pragma mark -
- (void)searchChanged:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            self.search.dateDescriptor = @"lastWeek";
            break;
        case 1:
            self.search.dateDescriptor = @"thisWeek";
            break;
        case 2:
            self.search.dateDescriptor = @"nextWeek";
            break;
        default:
            break;
    }
    
    self.comics = nil;
    
    [self.tableView reloadData];
    
    [self reload];
}

- (void)reload
{
    __weak typeof(self) blockSelf = self;
    
    [NSURLSessionDataTask fetchComicsWithSearch:self.search
                                     withBlock:^(MDAComicDataWrapper *wrapper, NSError *error) {
        if (!error) {
            blockSelf.comics = wrapper.data.results;
            
            [blockSelf.tableView reloadData];
        } else {
            NSLog(@"error: %@", error);
        }
    }];
}

- (void)barcodeAction
{
    __weak typeof(self) blockSelf = self;
    
    CBPBarCodeViewController *vc = [[CBPBarCodeViewController alloc] initWithBlock:^(NSString *barcode) {
        [blockSelf dismissViewControllerAnimated:YES completion:nil];
        
        if (barcode) {            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.upc BEGINSWITH[c] %@", [barcode substringFromIndex:1]];
            NSArray *filteredArray = [self.comics filteredArrayUsingPredicate:predicate];
            
            if ([filteredArray count]) {
                UIViewController *vc = nil;
                if ([filteredArray count] == 1) {
                    vc = [[CBPComicViewController alloc] initWithComic:filteredArray[0]];
                } else {
                    vc = [[CBPComicListViewController alloc] initWithComics:filteredArray];
                }
                
                [blockSelf.navigationController pushViewController:vc animated:YES];
            }
        }
    }];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self.navigationController presentViewController:navController
                                            animated:YES
                                          completion:nil];
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComicCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ComicCell"];
    }
    
    MDAComic *comic = self.comics[indexPath.row];
    cell.textLabel.text = comic.title;
    cell.detailTextLabel.text = comic.descriptionText;
    
    [cell.imageView setImageWithURL:[comic.thumbnail imageForResolution:MDAImageResolutionPortraitMedium]
                   placeholderImage:[UIImage imageNamed:@"default"]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.comics count];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    
    CBPComicViewController *vc = [[CBPComicViewController alloc] initWithComic:self.comics[indexPath.row]];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
