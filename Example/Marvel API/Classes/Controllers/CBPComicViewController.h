//
//  CBPComicViewController.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPTableViewController.h"

@class MDAComic;
@class MDAComicSummary;

@interface CBPComicViewController : CBPTableViewController
- (id)initWithComic:(MDAComic *)comic;
- (id)initWithComicSummary:(MDAComicSummary *)comicSummary;
@end
