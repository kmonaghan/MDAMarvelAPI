//
//  MDACharacter.m
//
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACharacter.h"

#import "MDAComicList.h"
#import "MDAEventList.h"
#import "MDASeriesList.h"
#import "MDAStoryList.h"
#import "MDAUrl.h"

@implementation MDACharacter

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDACharacter *instance = [MDACharacter new];
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
    if ([key isEqualToString:@"series"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.seriesList = [MDASeriesList initFromDictionary:value];
        }
    } else if ([key isEqualToString:@"urls"]) {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                MDAUrl *populatedMember = [MDAUrl initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.urls = myMembers;
            
        }
        
    } else {
        [super setValue:value forKey:key];
    }
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"characterId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;
    
    if (self.characterId) {
        [dictionary setObject:self.characterId forKey:@"characterId"];
    }
    
    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }
    
    if (self.urls) {
        [dictionary setObject:self.urls forKey:@"urls"];
    }
    
    return dictionary;
}

@end
