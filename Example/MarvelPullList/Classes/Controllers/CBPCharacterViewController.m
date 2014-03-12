//
//  CBPCharacterViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 23/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPCharacterViewController.h"

#import "MDACharacter.h"
#import "MDACharacterSummary.h"

@interface CBPCharacterViewController ()
@property (strong, nonatomic) MDACharacter *character;
@property (strong, nonatomic) MDACharacterSummary *characterSummary;
@end

@implementation CBPCharacterViewController

- (id)initWithCharacterSummary:(MDACharacterSummary *)characterSummary
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        _characterSummary = characterSummary;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self loadCharacter];
}

#pragma mark -
- (void)loadCharacterView
{
    [self loadSections:self.character];
    
    [self.tableView reloadData];
}

- (void)loadCharacter
{
    __weak typeof(self) blockSelf = self;
    
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading", nil)];
    
    [NSURLSessionDataTask fetchCharacterWithId:[self.characterSummary resourceId]
                                     withBlock:^(MDACharacter *character, NSError *error) {
                                         [SVProgressHUD dismiss];
                                         
                                         if (!error) {
                                             blockSelf.character = character;
                                             
                                             [blockSelf loadCharacterView];
                                         } else {
                                             [CRToastManager showNotificationWithOptions:@{kCRToastTextKey: [error localizedDescription],
                                                                                           kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
                                                                                           kCRToastBackgroundColorKey : [UIColor redColor]}
                                                                         completionBlock:nil];
                                         }
                                         
                                     }];
}

@end
