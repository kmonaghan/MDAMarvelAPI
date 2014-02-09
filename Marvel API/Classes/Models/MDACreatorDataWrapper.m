//
//  MDACreatorDataWrapper.m
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACreatorDataWrapper.h"

#import "MDACreatorDataContainer.h"

@implementation MDACreatorDataWrapper

+ (MDACreatorDataWrapper *)initFromDictionary:(NSDictionary *)aDictionary
{

    MDACreatorDataWrapper *instance = [[MDACreatorDataWrapper alloc] init];
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

- (void)setValue:(id)value forKey:(NSString *)key
{

    if ([key isEqualToString:@"data"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.data = [MDACreatorDataContainer instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.code) {
        [dictionary setObject:self.code forKey:@"code"];
    }

    if (self.data) {
        [dictionary setObject:self.data forKey:@"data"];
    }

    if (self.etag) {
        [dictionary setObject:self.etag forKey:@"etag"];
    }

    if (self.status) {
        [dictionary setObject:self.status forKey:@"status"];
    }

    return dictionary;

}

@end
