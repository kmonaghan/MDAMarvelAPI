//
//  MDATextObject.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDATextObject.h"

@implementation MDATextObject

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{

    MDATextObject *instance = [[MDATextObject alloc] init];
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

    if (self.language)
    {
        [dictionary setObject:self.language forKey:@"language"];
    }

    if (self.text)
    {
        [dictionary setObject:self.text forKey:@"text"];
    }

    if (self.type)
    {
        [dictionary setObject:self.type forKey:@"type"];
    }

    return dictionary;

}

@end
