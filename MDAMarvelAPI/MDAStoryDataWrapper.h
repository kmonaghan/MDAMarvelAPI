//
//  MDAStoryDataWrapper.h
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDAStoryDataContainer;

/**
 *  A data wrapper for Marvel stories.
 */
@interface MDAStoryDataWrapper : MDADataWrapper
/**
 *   The results returned by the call.
 */
@property (nonatomic, strong) MDAStoryDataContainer *data;

@end
