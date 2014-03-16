//
//  MDAEvent.h
//  
//
//  Created by Karl Monaghan on 17/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

@class MDAEventSummary;

/**
 *  An object to describe a Marvel Event.
 */
@interface MDAEvent : MDAObject
/**
 *  The date of publication of the last issue in this event.
 */
@property (nonatomic, strong) NSDate *end;
/**
 *  The unique ID of the event resource.
 */
@property (nonatomic, strong) NSString *eventId;
/**
 *  A summary representation of the event which follows this event.
 */
@property (nonatomic, strong) MDAEventSummary *next;
/**
 *  A summary representation of the event which preceded this event.
 */
@property (nonatomic, strong) MDAEventSummary *previous;
/**
 *  The date of publication of the first issue in this event.
 */
@property (nonatomic, strong) NSDate *start;
/**
 *  The title of the event.
 */
@property (nonatomic, strong) NSString *title;
/**
 *  A set of public web site URLs for the event. These are represented by MDAUrl objects.
 */
@property (nonatomic, strong) NSArray *urls;

@end
