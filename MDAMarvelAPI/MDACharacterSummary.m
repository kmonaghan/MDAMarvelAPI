//
//  MDACharacterSummary.m
//  Marvel API
//
//  Created by Karl Monaghan on 13/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACharacterSummary.h"

@implementation MDACharacterSummary
+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDACharacterSummary *instance = [MDACharacterSummary new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;
    
    if (self.role) {
        [dictionary setObject:self.role forKey:@"role"];
    }
    
    return dictionary;
}
@end
