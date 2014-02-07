//
//  CBPURI.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPURI.h"

@implementation CBPURI

+ (CBPURI *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    CBPURI *instance = [[CBPURI alloc] init];
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"URIid"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


@end
