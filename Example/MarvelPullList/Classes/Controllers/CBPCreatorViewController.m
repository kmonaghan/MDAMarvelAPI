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

@interface CBPCreatorViewController ()
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
    
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading", nil)];
    
    [NSURLSessionDataTask fetchCreatorWithId:[self.creatorSummary resourceId]
                                withBlock:^(MDACreator *creator, NSError *error) {
                                    [SVProgressHUD dismiss];
                                    
                                    if (!error) {
                                        blockSelf.creator = creator;
                                        
                                        [blockSelf loadCreatorView];
                                    } else {
                                        
                                        [CRToastManager showNotificationWithOptions:@{kCRToastTextKey: [error localizedDescription],
                                                                                      kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
                                                                                      kCRToastBackgroundColorKey : [UIColor redColor]}
                                                                    completionBlock:nil];
                                    }
                                    
                                }];
}
@end
