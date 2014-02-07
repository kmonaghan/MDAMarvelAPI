//
//  MDAStoriesCollectionURI.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAStoriesCollectionURI.h"

@implementation MDAStoriesCollectionURI

+ (MDAStoriesCollectionURI *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDAStoriesCollectionURI *instance = [[MDAStoriesCollectionURI alloc] init];
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"id"])
    {
        [self setValue:value forKey:@"storiesCollectionURIId"];
    } else
    {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    [dictionary setObject:[NSNumber numberWithInteger:self.storiesCollectionURIId] forKey:@"storiesCollectionURIId"];

    if (self.service)
    {
        [dictionary setObject:self.service forKey:@"service"];
    }

    return dictionary;

}

@end
