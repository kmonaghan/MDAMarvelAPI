//
//  CBPViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPViewController.h"

#import "NSURLSessionDataTask+MarvelDeveloperAPI.h"

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
    
    [self reload];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Reload", nil)
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(reload)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)reload
{
    [NSURLSessionDataTask fetchComicWithId:46968 withhBlock:^(MDAComic *comic, NSError *error) {
        if (!error) {
            self.textView.text = [NSString stringWithFormat:@"%@", [comic dictionaryRepresentation]];
        } else {
            self.textView.text = [NSString stringWithFormat:@"%@", error];
        }
    }];
}
@end
