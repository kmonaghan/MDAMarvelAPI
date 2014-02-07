//
//  MDACreator.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACreator.h"

@implementation MDACreator

+ (MDACreator *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDACreator *instance = [[MDACreator alloc] init];
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

    if (self.name)
    {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.resourceURI)
    {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }

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
