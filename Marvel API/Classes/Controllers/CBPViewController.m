//
//  CBPViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPViewController.h"

@interface CBPViewController ()
@property (strong, nonatomic) UITextView *textView;
@end

@implementation CBPViewController

- (void)loadView
{
    [super loadView];
    
    self.textView = [[UITextView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:self.textView];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
