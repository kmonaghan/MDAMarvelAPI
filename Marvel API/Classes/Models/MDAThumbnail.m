//
//  MDAThumbnail.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAThumbnail.h"

@implementation MDAThumbnail

+ (MDAThumbnail *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDAThumbnail *instance = [[MDAThumbnail alloc] init];
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

    if (self.extension)
    {
        [dictionary setObject:self.extension forKey:@"extension"];
    }

    if (self.path)
    {
        [dictionary setObject:self.path forKey:@"path"];
    }

    return dictionary;

}

@end
