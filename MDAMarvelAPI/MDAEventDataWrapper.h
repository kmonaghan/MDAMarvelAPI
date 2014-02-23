//
//  MDAEventDataWrapper.h
//  
//
//  Created by Karl Monaghan on 17/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDAEventDataContainer;

@interface MDAEventDataWrapper : MDADataWrapper

@property (nonatomic, strong) MDAEventDataContainer *data;

@end
