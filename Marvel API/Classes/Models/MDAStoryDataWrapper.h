//
//  MDAStoryDataWrapper.h
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@class MDAStoryDataContainer;

@interface MDAStoryDataWrapper : MDADataWrapper

@property (nonatomic, strong) MDAStoryDataContainer *data;

@end
