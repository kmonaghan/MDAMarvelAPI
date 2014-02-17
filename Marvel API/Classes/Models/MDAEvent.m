//
//  MDAEvent.m
//
//
//  Created by Karl Monaghan on 17/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAEvent.h"

#import "MDACharacterList.h"
#import "MDAComicList.h"
#import "MDACreatorList.h"
#import "MDAEventSummary.h"
#import "MDASeriesList.h"
#import "MDAStoryList.h"
#import "MDAImage.h"
#import "MDAUrl.h"

@implementation MDAEvent

+ (MDAEvent *)initFromDictionary:(NSDictionary *)aDictionary
{
    
    MDAEvent *instance = [[MDAEvent alloc] init];
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
        
    } else if ([key isEqualToString:@"next"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.next = [MDAEventSummary initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"previous"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.previous = [MDAEventSummary initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"series"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.series = [MDASeriesList initFromDictionary:value];
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
        [self setValue:value forKey:@"eventId"];
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
    
    if (self.end) {
        [dictionary setObject:self.end forKey:@"end"];
    }
    
    if (self.eventId) {
        [dictionary setObject:self.eventId forKey:@"eventId"];
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
    
    if (self.resourceURI) {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }
    
    if (self.series) {
        [dictionary setObject:self.series forKey:@"series"];
    }
    
    if (self.start) {
        [dictionary setObject:self.start forKey:@"start"];
    }
    
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
