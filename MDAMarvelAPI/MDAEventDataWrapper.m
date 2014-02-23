//
//  MDAEventDataWrapper.m
//
//
//  Created by Karl Monaghan on 17/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAEventDataWrapper.h"

#import "MDAEventDataContainer.h"

@implementation MDAEventDataWrapper

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAEventDataWrapper *instance = [[MDAEventDataWrapper alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"data"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.data = [MDAEventDataContainer initFromDictionary:value];
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
