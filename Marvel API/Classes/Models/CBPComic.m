//
//  CBPComic.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPComic.h"

#import "CBPCharacters.h"
#import "CBPCreators.h"
#import "CBPDate.h"
#import "CBPEvents.h"
#import "CBPImage.h"
#import "CBPPrice.h"
#import "CBPSeries.h"
#import "CBPStories.h"
#import "CBPThumbnail.h"
#import "CBPUrl.h"

@implementation CBPComic

+ (CBPComic *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    CBPComic *instance = [[CBPComic alloc] init];
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
            self.characters = [CBPCharacters instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"collectedIssues"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.collectedIssues = myMembers;

        }

    } else if ([key isEqualToString:@"collections"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.collections = myMembers;

        }

    } else if ([key isEqualToString:@"creators"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.creators = [CBPCreators instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"dates"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                CBPDate *populatedMember = [CBPDate instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.dates = myMembers;

        }

    } else if ([key isEqualToString:@"events"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.events = [CBPEvents instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"images"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                CBPImage *populatedMember = [CBPImage instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.images = myMembers;

        }

    } else if ([key isEqualToString:@"prices"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                CBPPrice *populatedMember = [CBPPrice instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.prices = myMembers;

        }

    } else if ([key isEqualToString:@"series"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.series = [CBPSeries instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"stories"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.stories = [CBPStories instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"textObjects"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.textObjects = myMembers;

        }

    } else if ([key isEqualToString:@"thumbnail"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.thumbnail = [CBPThumbnail instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"urls"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                CBPUrl *populatedMember = [CBPUrl instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.urls = myMembers;

        }

    } else if ([key isEqualToString:@"variants"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                [myMembers addObject:valueMember];
            }

            self.variants = myMembers;

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
        [self setValue:value forKey:@"comicId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


@end
