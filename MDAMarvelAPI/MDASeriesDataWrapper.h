//
//  MDASeriesDataWrapper.h
//  
//
//  Created by Karl Monaghan on 22/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDASeriesDataContainer;

/**
 *  A data wrapper for Marvel series.
 */
@interface MDASeriesDataWrapper : MDADataWrapper
/**
 *   The results returned by the call.
 */
@property (nonatomic, strong) MDASeriesDataContainer *data;

@end
