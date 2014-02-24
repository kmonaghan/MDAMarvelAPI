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
    
    [NSURLSessionDataTask fetchStoryWithId:[self.storySummary resourceId]
                                   withBlock:^(MDAStory *story, NSError *error) {
                                       blockSelf.story = story;
                                       
                                       [blockSelf loadStoryView];
                                       
                                   }];
}
@end
