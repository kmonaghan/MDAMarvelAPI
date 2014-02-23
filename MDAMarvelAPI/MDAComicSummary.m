//
//  MDAComicSummary.m
//
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAComicSummary.h"

@implementation MDAComicSummary

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAComicSummary *instance = [[MDAComicSummary alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;
    
    if (self.type) {
        [dictionary setObject:self.type forKey:@"type"];
    }
    
    return dictionary;
}

@end
