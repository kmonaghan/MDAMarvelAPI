//
//  MDAEventSummary.m
//  Marvel API
//
//  Created by Karl Monaghan on 13/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAEventSummary.h"

@implementation MDAEventSummary

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAEventSummary *instance = [MDAEventSummary new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

@end
