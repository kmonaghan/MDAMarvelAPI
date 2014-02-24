//
//  MDAList.m
//  MarvelPullList
//
//  Created by Karl Monaghan on 24/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAList.h"

@implementation MDAList
+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAList *instance = [MDAList new];
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
    if ([key isEqualToString:@"items"]) {
        //Child classes should implement this
    } else {
        [super setValue:value forKey:key];
    }
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    [dictionary setObject:[NSNumber numberWithInteger:self.available] forKey:@"available"];
    
    if (self.collectionURI) {
        [dictionary setObject:self.collectionURI forKey:@"collectionURI"];
    }
    
    if (self.items) {
        [dictionary setObject:self.items forKey:@"items"];
    }
    
    [dictionary setObject:[NSNumber numberWithInteger:self.returned] forKey:@"returned"];
    
    return dictionary;
}

@end
