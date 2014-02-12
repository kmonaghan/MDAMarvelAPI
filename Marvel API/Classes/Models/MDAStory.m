//
//  MDAStory.m
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 skillpages. All rights reserved.
//

#import "MDAStory.h"

#import "MDACharacterListList.h"
#import "MDAComicList.h"
#import "MDACreatorList.h"
#import "MDAEventList.h"
#import "MDAComicSummary.h"
#import "MDASeriesList.h"
#import "MDAImage.h"

@implementation MDAStory

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.characters forKey:@"characters"];
    [encoder encodeObject:self.comics forKey:@"comics"];
    [encoder encodeObject:self.creators forKey:@"creators"];
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.events forKey:@"events"];
    [encoder encodeObject:self.modified forKey:@"modified"];
    [encoder encodeObject:self.originalissue forKey:@"originalissue"];
    [encoder encodeObject:self.resourceURI forKey:@"resourceURI"];
    [encoder encodeObject:self.storyId forKey:@"storyId"];
    [encoder encodeObject:self.series forKey:@"series"];
    [encoder encodeObject:self.thumbnail forKey:@"thumbnail"];
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.type forKey:@"type"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init]))
    {
        self.characters = [decoder decodeObjectForKey:@"characters"];
        self.comics = [decoder decodeObjectForKey:@"comics"];
        self.creators = [decoder decodeObjectForKey:@"creators"];
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.events = [decoder decodeObjectForKey:@"events"];
        self.modified = [decoder decodeObjectForKey:@"modified"];
        self.originalissue = [decoder decodeObjectForKey:@"originalissue"];
        self.resourceURI = [decoder decodeObjectForKey:@"resourceURI"];
        self.storyId = [decoder decodeObjectForKey:@"storyId"];
        self.series = [decoder decodeObjectForKey:@"series"];
        self.thumbnail = [decoder decodeObjectForKey:@"thumbnail"];
        self.title = [decoder decodeObjectForKey:@"title"];
        self.type = [decoder decodeObjectForKey:@"type"];
    }
    return self;
}

+ (MDAStory *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDAStory *instance = [[MDAStory alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]])
    {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key
{

    if ([key isEqualToString:@"characters"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.characters = [MDACharacterListList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"comics"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.comics = [MDAComicList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"creators"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.creators = [MDACreatorList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"events"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.events = [MDAEventList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"originalissue"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.originalissue = [MDAComicSummary instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"series"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.series = [MDASeriesList instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"thumbnail"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.thumbnail = [MDAImage instanceFromDictionary:value];
        }

    } else
    {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"description"])
    {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"id"])
    {
        [self setValue:value forKey:@"storyId"];
    } else
    {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.characters)
    {
        [dictionary setObject:self.characters forKey:@"characters"];
    }

    if (self.comics)
    {
        [dictionary setObject:self.comics forKey:@"comics"];
    }

    if (self.creators)
    {
        [dictionary setObject:self.creators forKey:@"creators"];
    }

    if (self.descriptionText)
    {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    if (self.events)
    {
        [dictionary setObject:self.events forKey:@"events"];
    }

    if (self.modified)
    {
        [dictionary setObject:self.modified forKey:@"modified"];
    }

    if (self.originalissue)
    {
        [dictionary setObject:self.originalissue forKey:@"originalissue"];
    }

    if (self.resourceURI)
    {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }

    if (self.storyId)
    {
        [dictionary setObject:self.storyId forKey:@"storyId"];
    }

    if (self.series)
    {
        [dictionary setObject:self.series forKey:@"series"];
    }

    if (self.thumbnail)
    {
        [dictionary setObject:self.thumbnail forKey:@"thumbnail"];
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
