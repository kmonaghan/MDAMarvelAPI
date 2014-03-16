//
//  MDASeries.h
//  
//
//  Created by Karl Monaghan on 22/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

/**
 *  An object to describe a Marvel Series
 */
@interface MDASeries : MDAObject
/**
 *  The last year of publication for the series (conventionally, 2099 for ongoing series).
 */
@property (nonatomic, assign) NSInteger endYear;
/**
 *  The unique ID of the series resource.
 */
@property (nonatomic, strong) NSString *seriesId;
/**
 *  A summary representation of the series which follows this series.
 */
@property (nonatomic, strong) MDASeriesSummary *next;
/**
 *  A summary representation of the series which preceded this series.
 */
@property (nonatomic, strong) MDASeriesSummary *previous;
/**
 *  The age-appropriateness rating for the series.
 */
@property (nonatomic, strong) NSString *rating;
/**
 *  The first year of publication for the series.
 */
@property (nonatomic, assign) NSInteger startYear;
/**
 *  The canonical title of the series.
 */
@property (nonatomic, strong) NSString *title;
/**
 *  A set of public web site URLs for the resource. These are represented as MDAUrl objects.
 */
@property (nonatomic, strong) NSArray *urls;

@end
