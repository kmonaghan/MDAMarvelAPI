//
//  MDAComicDataWrapper.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDAComicDataContainer;

/**
 *  A data wrapper for Marvel comics.
 */
@interface MDAComicDataWrapper : MDADataWrapper
/**
 *   The results returned by the call.
 */
@property (nonatomic, strong) MDAComicDataContainer *data;

@end
