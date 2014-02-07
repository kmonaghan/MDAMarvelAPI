//
//  MDADate.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADate.h"

@implementation MDADate

+ (MDADate *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDADate *instance = [[MDADate alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]])
    {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.date)
    {
        [dictionary setObject:self.date forKey:@"date"];
    }

    if (self.type)
    {
        [dictionary setObject:self.type forKey:@"type"];
    }

    return dictionary;

}

@end
