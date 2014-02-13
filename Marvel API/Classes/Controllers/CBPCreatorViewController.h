//
//  CBPCreatorViewController.h
//  Marvel API
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPTableViewController.h"

@class MDACreatorSummary;

@interface CBPCreatorViewController : CBPTableViewController
- (id)initWithCreatorSummary:(MDACreatorSummary *)creatorSummary;
@end
