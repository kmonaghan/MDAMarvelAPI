//
//  MDACharacterDataWrapper.h
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDACharacterDataContainer;

/**
 *  A data wrapper for Marvel characters.
 */
@interface MDACharacterDataWrapper : MDADataWrapper
/**
 *   The results returned by the call.
 */
@property (nonatomic, strong) MDACharacterDataContainer *data;

@end
