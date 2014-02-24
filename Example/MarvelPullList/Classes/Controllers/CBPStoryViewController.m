//
//  CBPStoryViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 23/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPStoryViewController.h"

#import "MDAStory.h"
#import "MDAStorySummary.h"

@interface CBPStoryViewController ()
@property (strong, nonatomic) MDAStory *story;
@property (strong, nonatomic) MDAStorySummary *storySummary;
@end

@implementation CBPStoryViewController

- (id)initWithStorySummary:(MDAStorySummary *)storySummary
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        _storySummary = storySummary;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self loadStory];
}

#pragma mark -
- (void)loadStoryView
{
    [self loadSections:self.story];
    
    [self.tableView reloadData];
}

- (void)loadStory
{
    __weak typeof(self) blockSelf = self;
    
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading", nil)];
    
    [NSURLSessionDataTask fetchStoryWithId:[self.storySummary resourceId]
                                  withBlock:^(MDAStory *story, NSError *error) {
                                      [SVProgressHUD dismiss];
                                      
                                      if (!error) {
                                          blockSelf.story = story;
                                          
                                          [blockSelf loadStoryView];
                                      } else {
                                          [CSNotificationView showInViewController:blockSelf
                                                                             style:CSNotificationViewStyleError
                                                                           message:[error localizedDescription]];
                                      }
                                  }];
}
@end
