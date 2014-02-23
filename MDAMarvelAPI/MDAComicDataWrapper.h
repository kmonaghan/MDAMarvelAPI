//
//  MDAComicDataWrapper.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDAComicDataContainer;

@interface MDAComicDataWrapper : MDADataWrapper

@property (nonatomic, strong) MDAComicDataContainer *data;

@end
