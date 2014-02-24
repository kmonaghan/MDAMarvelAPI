//
//  MDASeriesDataWrapper.m
//  
//
//  Created by Karl Monaghan on 22/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASeriesDataWrapper.h"

#import "MDASeriesDataContainer.h"

@implementation MDASeriesDataWrapper

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDASeriesDataWrapper *instance = [MDASeriesDataWrapper new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"data"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.data = [MDASeriesDataContainer initFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;

    if (self.data) {
        [dictionary setObject:self.data forKey:@"data"];
    }

    return dictionary;
}

@end
