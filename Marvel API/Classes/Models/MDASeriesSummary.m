//
//  MDASeriesSummary.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASeriesSummary.h"

@implementation MDASeriesSummary
+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDASeriesSummary *instance = [MDASeriesSummary new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}
@end
