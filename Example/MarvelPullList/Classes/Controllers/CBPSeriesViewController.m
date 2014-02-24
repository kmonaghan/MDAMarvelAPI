//
//  CBPSeriesViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPSeriesViewController.h"

#import "MDASeries.h"
#import "MDASeriesSummary.h"

@interface CBPSeriesViewController ()
@property (strong, nonatomic) MDASeries *series;
@property (strong, nonatomic) MDASeriesSummary *seriesSummary;
@end

@implementation CBPSeriesViewController

- (id)initWithSeriesSummary:(MDASeriesSummary *)seriesSummary
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        _seriesSummary = seriesSummary;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self loadSeries];
}

#pragma mark -
- (void)loadSeriesView
{
    [self loadSections:self.series];
    
    [self.tableView reloadData];
}

- (void)loadSeries
{
    __weak typeof(self) blockSelf = self;
    
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading", nil)];
    
    [NSURLSessionDataTask fetchSeriesWithId:[self.seriesSummary resourceId]
                                 withBlock:^(MDASeries *series, NSError *error) {
                                     [SVProgressHUD dismiss];
                                     
                                     if (!error) {
                                         blockSelf.series = series;
                                     
                                         [blockSelf loadSeriesView];
                                     } else {
                                         [CSNotificationView showInViewController:blockSelf
                                                                            style:CSNotificationViewStyleError
                                                                          message:[error localizedDescription]];
                                     }
                                 }];
}

@end
