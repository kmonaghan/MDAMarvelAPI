//
//  MDACharacterDataWrapper.h
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDACharacterDataContainer;

@interface MDACharacterDataWrapper : MDADataWrapper

@property (nonatomic, strong) MDACharacterDataContainer *data;

@end
