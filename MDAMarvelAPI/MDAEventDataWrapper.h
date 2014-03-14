//
//  MDAEventDataWrapper.h
//  
//
//  Created by Karl Monaghan on 17/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDAEventDataContainer;

/**
 *  A data wrapper for Marvel events.
 */
@interface MDAEventDataWrapper : MDADataWrapper
/**
 *   The results returned by the call.
 */
@property (nonatomic, strong) MDAEventDataContainer *data;

@end
