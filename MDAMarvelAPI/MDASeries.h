//
//  MDASeries.h
//  
//
//  Created by Karl Monaghan on 22/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

@class MDAImage;

/**
 *  An object to describe a Marvel Series
 */
@interface MDASeries : MDAObject

@property (nonatomic, assign) NSInteger endYear;
@property (nonatomic, strong) NSString *seriesId;
@property (nonatomic, strong) MDASeriesSummary *next;
@property (nonatomic, strong) MDASeriesSummary *previous;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, assign) NSInteger startYear;
@property (nonatomic, strong) MDAImage *thumbnail;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *urls;

@end
