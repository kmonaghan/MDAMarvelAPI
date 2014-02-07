//
//  MDAPrice.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAPrice.h"

@implementation MDAPrice

+ (MDAPrice *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDAPrice *instance = [[MDAPrice alloc] init];
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

    [dictionary setObject:[NSNumber numberWithFloat:self.price] forKey:@"price"];

    if (self.type)
    {
        [dictionary setObject:self.type forKey:@"type"];
    }

    return dictionary;

}

@end
