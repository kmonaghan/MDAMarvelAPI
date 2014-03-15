//
//  MDAEvent.h
//  
//
//  Created by Karl Monaghan on 17/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

@class MDAEventSummary;
@class MDAImage;

/**
 *  An object to describe a Marvel Event.
 */
@interface MDAEvent : MDAObject

@property (nonatomic, strong) NSDate *end;
@property (nonatomic, strong) NSString *eventId;
@property (nonatomic, strong) MDAEventSummary *next;
@property (nonatomic, strong) MDAEventSummary *previous;
@property (nonatomic, strong) NSDate *start;
@property (nonatomic, strong) MDAImage *thumbnail;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *urls;

@end
