//
//  MDAImage.m
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAImage.h"

@implementation MDAImage

+ (MDAImage *)initFromDictionary:(NSDictionary *)aDictionary
{

    MDAImage *instance = [[MDAImage alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.extension) {
        [dictionary setObject:self.extension forKey:@"extension"];
    }

    if (self.path) {
        [dictionary setObject:self.path forKey:@"path"];
    }

    return dictionary;

}

@end
