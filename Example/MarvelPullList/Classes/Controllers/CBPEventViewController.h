//
//  CBPEventViewController.h
//  Marvel API
//
//  Created by Karl Monaghan on 23/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPTableViewController.h"

@class MDAEventSummary;

@interface CBPEventViewController : CBPTableViewController
- (id)initWithEventSummary:(MDAEventSummary *)eventSummary;
@end
