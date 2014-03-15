//
//  MDAComicDate.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAComicDate.h"

@implementation MDAComicDate

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAComicDate *instance = [[MDAComicDate alloc] init];
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

- (void)setValue:(id)value forKey:(NSString *)key
{
    
    if ([key isEqualToString:@"date"]) {
        static NSDateFormatter *mdaDateFormatter = nil;
        if (mdaDateFormatter == nil) {
            mdaDateFormatter = [NSDateFormatter new];
            [mdaDateFormatter setLocale:[NSLocale currentLocale]];
            [mdaDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
        }
        
        self.date = [mdaDateFormatter dateFromString:value];
    } else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.date)
    {
        [dictionary setObject:self.date forKey:@"date"];
    }

    if (self.type)
    {
        [dictionary setObject:self.type forKey:@"type"];
    }

    return dictionary;

}

@end
