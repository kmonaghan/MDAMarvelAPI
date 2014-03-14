//
//  MDACreatorDataWrapper.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDACreatorDataContainer;

/**
 *  A data wrapper for Marvel creators.
 */
@interface MDACreatorDataWrapper : MDADataWrapper

@property (nonatomic, strong) MDACreatorDataContainer *data;

@end
