//
//  CBPComicViewController.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDAComic;
@class MDAComicSummary;

@interface CBPComicViewController : UIViewController
- (id)initWithComic:(MDAComic *)comic;
- (id)initWithComicSummary:(MDAComicSummary *)comicSummary;
@end
