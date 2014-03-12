//
//  CBPEventViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 23/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPEventViewController.h"

#import "MDAEvent.h"
#import "MDAEventSummary.h"

@interface CBPEventViewController ()
@property (strong, nonatomic) MDAEvent *event;
@property (strong, nonatomic) MDAEventSummary *eventSummary;
@end

@implementation CBPEventViewController

- (id)initWithEventSummary:(MDAEventSummary *)eventSummary
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        _eventSummary = eventSummary;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self loadEvent];
}

#pragma mark -
- (void)loadEventView
{
    [self loadSections:self.event];
    
    [self.tableView reloadData];
}

- (void)loadEvent
{
    __weak typeof(self) blockSelf = self;
    
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading", nil)];
    
    [NSURLSessionDataTask fetchEventWithId:[self.eventSummary resourceId]
                                 withBlock:^(MDAEvent *event, NSError *error) {
                                     [SVProgressHUD dismiss];
                                     
                                     if (!error) {
                                         blockSelf.event = event;
                                         
                                         [blockSelf loadEventView];
                                     } else {
                                         [CRToastManager showNotificationWithOptions:@{kCRToastTextKey: [error localizedDescription],
                                                                                       kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
                                                                                       kCRToastBackgroundColorKey : [UIColor redColor]}
                                                                     completionBlock:nil];
                                     }
                                 }];
}

@end
