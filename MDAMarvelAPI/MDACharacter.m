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
#import "MDAImage.h"
#import "MDAUrl.h"

@implementation MDACharacter

+ (MDACharacter *)initFromDictionary:(NSDictionary *)aDictionary
{
    
    MDACharacter *instance = [[MDACharacter alloc] init];
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
    
    if ([key isEqualToString:@"comics"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.comics = [MDAComicList initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"events"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.events = [MDAEventList initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"series"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.series = [MDASeriesList initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"stories"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.stories = [MDAStoryList initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"thumbnail"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.thumbnail = [MDAImage initFromDictionary:value];
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
    
    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"characterId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
    
}


- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.comics) {
        [dictionary setObject:self.comics forKey:@"comics"];
    }
    
    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }
    
    if (self.events) {
        [dictionary setObject:self.events forKey:@"events"];
    }
    
    if (self.characterId) {
        [dictionary setObject:self.characterId forKey:@"characterId"];
    }
    
    if (self.modified) {
        [dictionary setObject:self.modified forKey:@"modified"];
    }
    
    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }
    
    if (self.resourceURI) {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }
    
    if (self.series) {
        [dictionary setObject:self.series forKey:@"series"];
    }
    
    if (self.stories) {
        [dictionary setObject:self.stories forKey:@"stories"];
    }
    
    if (self.thumbnail) {
        [dictionary setObject:self.thumbnail forKey:@"thumbnail"];
    }
    
    if (self.urls) {
        [dictionary setObject:self.urls forKey:@"urls"];
    }
    
    return dictionary;
    
}

@end
