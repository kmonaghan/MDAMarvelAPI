//
//  MDADataWrapper.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDADataWrapper.h"

@implementation MDADataWrapper

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDADataWrapper *instance = [[MDADataWrapper alloc] init];
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
    NSLog(@"Undefined key: %@ with value %@", key, value);
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    [dictionary setObject:[NSNumber numberWithInteger:self.code] forKey:@"code"];

    if (self.etag)
    {
        [dictionary setObject:self.etag forKey:@"etag"];
    }

    if (self.status)
    {
        [dictionary setObject:self.status forKey:@"status"];
    }

    return dictionary;
}

@end
