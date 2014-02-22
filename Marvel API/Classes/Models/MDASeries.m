//
//  MDASeries.m
//  
//
//  Created by Karl Monaghan on 22/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASeries.h"

#import "MDACharacterList.h"
#import "MDAComicList.h"
#import "MDACreatorList.h"
#import "MDAEventList.h"
#import "MDASeriesSummary.h"
#import "MDAStoryList.h"
#import "MDAImage.h"
#import "MDAUrl.h"

@implementation MDASeries

+ (MDASeries *)initFromDictionary:(NSDictionary *)aDictionary
{

    MDASeries *instance = [[MDASeries alloc] init];
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

    if ([key isEqualToString:@"characters"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.characters = [MDACharacterList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"comics"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.comics = [MDAComicList initFromDictionary:value];
        }

    } else if ([key isEqualToString:@"creators"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.creators = [MDACreatorList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"events"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.events = [MDAEventList initFromDictionary:value];
        }

    } else if ([key isEqualToString:@"next"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.next = [MDASeriesSummary initFromDictionary:value];
        }

    } else if ([key isEqualToString:@"previous"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.previous = [MDASeriesSummary initFromDictionary:value];
        }

    } else if ([key isEqualToString:@"stories"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.stories = [MDAStoryList instanceFromDictionary:value];
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
        [self setValue:value forKey:@"seriesId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.characters) {
        [dictionary setObject:self.characters forKey:@"characters"];
    }

    if (self.comics) {
        [dictionary setObject:self.comics forKey:@"comics"];
    }

    if (self.creators) {
        [dictionary setObject:self.creators forKey:@"creators"];
    }

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    [dictionary setObject:[NSNumber numberWithInteger:self.endYear] forKey:@"endYear"];

    if (self.events) {
        [dictionary setObject:self.events forKey:@"events"];
    }

    if (self.seriesId) {
        [dictionary setObject:self.seriesId forKey:@"seriesId"];
    }

    if (self.modified) {
        [dictionary setObject:self.modified forKey:@"modified"];
    }

    if (self.next) {
        [dictionary setObject:self.next forKey:@"next"];
    }

    if (self.previous) {
        [dictionary setObject:self.previous forKey:@"previous"];
    }

    if (self.rating) {
        [dictionary setObject:self.rating forKey:@"rating"];
    }

    if (self.resourceURI) {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }

    [dictionary setObject:[NSNumber numberWithInteger:self.startYear] forKey:@"startYear"];

    if (self.stories) {
        [dictionary setObject:self.stories forKey:@"stories"];
    }

    if (self.thumbnail) {
        [dictionary setObject:self.thumbnail forKey:@"thumbnail"];
    }

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }

    if (self.urls) {
        [dictionary setObject:self.urls forKey:@"urls"];
    }

    return dictionary;

}

@end
