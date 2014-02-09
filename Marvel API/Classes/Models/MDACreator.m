//
//  MDACreator.m
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACreator.h"

#import "MDAComicList.h"
#import "MDAEventList.h"
#import "MDASeriesList.h"
#import "MDAStoryList.h"
#import "MDAImage.h"
#import "MDAUrl.h"

@implementation MDACreator

+ (MDACreator *)initFromDictionary:(NSDictionary *)aDictionary
{

    MDACreator *instance = [[MDACreator alloc] init];
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
            self.comics = [MDAComicList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"events"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.events = [MDAEventList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"series"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.series = [MDASeriesList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"stories"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.stories = [MDAStoryList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"thumbnail"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.thumbnail = [MDAImage instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"urls"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                MDAUrl *populatedMember = [MDAUrl instanceFromDictionary:valueMember];
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
        [self setValue:value forKey:@"creatorId"];
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

    if (self.events) {
        [dictionary setObject:self.events forKey:@"events"];
    }

    if (self.firstName) {
        [dictionary setObject:self.firstName forKey:@"firstName"];
    }

    if (self.fullName) {
        [dictionary setObject:self.fullName forKey:@"fullName"];
    }

    if (self.lastName) {
        [dictionary setObject:self.lastName forKey:@"lastName"];
    }

    if (self.middleName) {
        [dictionary setObject:self.middleName forKey:@"middleName"];
    }

    if (self.modified) {
        [dictionary setObject:self.modified forKey:@"modified"];
    }

    if (self.resourceURI) {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }

    [dictionary setObject:[NSNumber numberWithInteger:self.creatorId] forKey:@"creatorId"];

    if (self.series) {
        [dictionary setObject:self.series forKey:@"series"];
    }

    if (self.stories) {
        [dictionary setObject:self.stories forKey:@"stories"];
    }

    if (self.suffix) {
        [dictionary setObject:self.suffix forKey:@"suffix"];
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
