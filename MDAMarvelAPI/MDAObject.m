//
//  MDAObject.m
//  Marvel API
//
//  Created by Karl Monaghan on 13/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

#import "MDACharacterList.h"
#import "MDAComicList.h"
#import "MDAComicSummary.h"
#import "MDACreatorList.h"
#import "MDAEventList.h"
#import "MDAImage.h"
#import "MDAStoryList.h"
#import "MDASeriesSummary.h"

@implementation MDAObject

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAObject *instance = [MDAObject new];
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

- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dictionary = @{}.mutableCopy;
    
    if (self.characters)
    {
        [dictionary setObject:self.characters forKey:@"characters"];
    }
    
    if (self.comics)
    {
        [dictionary setObject:self.characters forKey:@"comics"];
    }
    
    if (self.creators)
    {
        [dictionary setObject:self.creators forKey:@"creators"];
    }
    
    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }
    
    if (self.events)
    {
        [dictionary setObject:self.events forKey:@"events"];
    }
    
    if (self.modified) {
        [dictionary setObject:self.modified forKey:@"modified"];
    }
    
    if (self.resourceURI)
    {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }
    
    if (self.series)
    {
        [dictionary setObject:self.series forKey:@"series"];
    }
    
    if (self.stories)
    {
        [dictionary setObject:self.stories forKey:@"stories"];
    }
    
    if (self.thumbnail) {
        [dictionary setObject:self.thumbnail forKey:@"thumbnail"];
    }
    
    if (self.variants)
    {
        [dictionary setObject:self.variants forKey:@"variants"];
    }
    
    return dictionary;
    
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"characters"])
    {
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.characters = [MDACharacterList initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"comics"])
    {
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.comics = [MDAComicList initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"creators"])
    {
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.creators = [MDACreatorList initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"events"])
    {
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.events = [MDAEventList initFromDictionary:value];
        }
    } else if ([key isEqualToString:@"modified"]) {
        static NSDateFormatter *mdaDateFormatter = nil;
        if (mdaDateFormatter == nil) {
            mdaDateFormatter = [NSDateFormatter new];
            [mdaDateFormatter setLocale:[NSLocale currentLocale]];
            [mdaDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
        }
        
        self.modified = [mdaDateFormatter dateFromString:value];
    } else if ([key isEqualToString:@"series"])
    {
        //Needs to handled by child classes
        
    } else if ([key isEqualToString:@"stories"])
    {
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.stories = [MDAStoryList initFromDictionary:value];
        }
    } else if ([key isEqualToString:@"thumbnail"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.thumbnail = [MDAImage initFromDictionary:value];
        }
    } else if ([key isEqualToString:@"variants"]) {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
            {
                MDAComicSummary *populatedMember = [MDAComicSummary initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.variants = myMembers;
            
        }
        
    } else
    {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else {
        NSLog(@"Undefined key: %@ with value %@", key, value);

    }
}

@end
