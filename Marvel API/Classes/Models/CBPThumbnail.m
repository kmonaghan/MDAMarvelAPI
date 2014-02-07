//
//  CBPThumbnail.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPThumbnail.h"

@implementation CBPThumbnail

+ (CBPThumbnail *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    CBPThumbnail *instance = [[CBPThumbnail alloc] init];
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

@end
