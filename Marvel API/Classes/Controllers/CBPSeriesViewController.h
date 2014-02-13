//
//  CBPSeriesViewController.h
//  Marvel API
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPTableViewController.h"

@class MDASeriesSummary;

@interface CBPSeriesViewController : CBPTableViewController
- (id)initWithSeriesSummary:(MDASeriesSummary *)seriesSummary;
@end
