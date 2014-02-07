//
//  CBPComicResponse.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPComicResponse.h"

#import "CBPComicResponseData.h"

@implementation CBPComicResponse

+ (CBPComicResponse *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    CBPComicResponse *instance = [[CBPComicResponse alloc] init];
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
            self.data = [CBPComicResponseData instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


@end
