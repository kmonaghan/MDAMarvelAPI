//
//  MDACreatorSummary.m
//
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACreatorSummary.h"

@implementation MDACreatorSummary

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDACreatorSummary *instance = [MDACreatorSummary new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}



- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;
    
    if (self.role) {
        [dictionary setObject:self.role forKey:@"role"];
    }
    
    return dictionary;
}

@end
