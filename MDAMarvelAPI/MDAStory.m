//
//  MDAStory.m
//
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAStory.h"

#import "MDACharacterList.h"
#import "MDAComicList.h"
#import "MDACreatorList.h"
#import "MDAEventList.h"
#import "MDAComicSummary.h"
#import "MDASeriesList.h"

@implementation MDAStory

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAStory *instance = [[MDAStory alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"originalIssue"]) {
        if ([value isKindOfClass:[NSDictionary class]]){
            self.originalissue = [MDAComicSummary initFromDictionary:value];
        }
    } else if ([key isEqualToString:@"series"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.seriesList = [MDASeriesList initFromDictionary:value];
        }
    } else{
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"storyId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;
    
    if (self.originalissue)
    {
        [dictionary setObject:self.originalissue forKey:@"originalissue"];
    }
    
    if (self.storyId)
    {
        [dictionary setObject:self.storyId forKey:@"storyId"];
    }
    
    if (self.title)
    {
        [dictionary setObject:self.title forKey:@"title"];
    }
    
    if (self.type)
    {
        [dictionary setObject:self.type forKey:@"type"];
    }
    
    return dictionary;
    
}

@end
