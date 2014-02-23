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
    
    if (self.events)
    {
        [dictionary setObject:self.events forKey:@"events"];
    }
    
    if (self.series)
    {
        [dictionary setObject:self.series forKey:@"series"];
    }
    
    if (self.stories)
    {
        [dictionary setObject:self.stories forKey:@"stories"];
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
            self.characters = [MDACharacterList instanceFromDictionary:value];
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
            self.creators = [MDACreatorList instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"events"])
    {
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.events = [MDAEventList initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"series"])
    {
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.series = [MDASeriesSummary initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"stories"])
    {
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.stories = [MDAStoryList instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"variants"])
    {
        
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
@end