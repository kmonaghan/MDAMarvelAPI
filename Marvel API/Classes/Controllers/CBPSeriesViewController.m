//
//  CBPSeriesViewController.m
//  Marvel API
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPSeriesViewController.h"

#import "MDASeriesSummary.h"

@interface CBPSeriesViewController ()
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
