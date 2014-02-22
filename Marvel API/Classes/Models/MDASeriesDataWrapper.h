//
//  MDASeriesDataWrapper.h
//  
//
//  Created by Karl Monaghan on 22/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDASeriesDataContainer;

@interface MDASeriesDataWrapper : MDADataWrapper

@property (nonatomic, strong) MDASeriesDataContainer *data;

@end
