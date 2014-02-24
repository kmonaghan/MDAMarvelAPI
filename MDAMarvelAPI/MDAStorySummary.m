//
//  MDAStorySummary.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAStorySummary.h"

@implementation MDAStorySummary

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAStorySummary *instance = [MDAStorySummary new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;

    if (self.role)
    {
        [dictionary setObject:self.role forKey:@"role"];
    }

    if (self.type)
    {
        [dictionary setObject:self.type forKey:@"type"];
    }

    return dictionary;

}

@end
