//
//  MDACharacterDataWrapper.m
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACharacterDataWrapper.h"

#import "MDACharacterDataContainer.h"

@implementation MDACharacterDataWrapper

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDACharacterDataWrapper *instance = [[MDACharacterDataWrapper alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"data"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.data = [MDACharacterDataContainer initFromDictionary:value];
        }
    } else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;

    [dictionary setObject:[NSNumber numberWithInteger:self.code] forKey:@"code"];

    if (self.data) {
        [dictionary setObject:self.data forKey:@"data"];
    }

    return dictionary;
}

@end
