//
//  MDAComicSummary.m
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAComicSummary.h"

@implementation MDAComicSummary

+ (MDAComicSummary *)initFromDictionary:(NSDictionary *)aDictionary
{

    MDAComicSummary *instance = [[MDAComicSummary alloc] init];
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

- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.resourceURI) {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }

    if (self.type) {
        [dictionary setObject:self.type forKey:@"type"];
    }

    return dictionary;

}

@end
