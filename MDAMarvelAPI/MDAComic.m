//
//  MDAComic.m
//
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAComic.h"

#import "MDAComicDate.h"
#import "MDAComicPrice.h"
#import "MDAComicSummary.h"
#import "MDAImage.h"
#import "MDASeriesSummary.h"
#import "MDATextObject.h"
#import "MDAUrl.h"

@implementation MDAComic

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAComic *instance = [MDAComic new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"collectedIssues"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
            {
                MDAComicSummary *populatedMember = [MDAComicSummary initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.collectedIssues = myMembers;
            
        }
        
    } else if ([key isEqualToString:@"collections"]) {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
            {
                MDAComicSummary *populatedMember = [MDAComicSummary initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.collections = myMembers;
            
        }
        
    } else if ([key isEqualToString:@"dates"])
    {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
            {
                MDAComicDate *populatedMember = [MDAComicDate initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.dates = myMembers;
            
        }
        
    } else if ([key isEqualToString:@"images"])
    {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
            {
                MDAImage *populatedMember = [MDAImage initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.images = myMembers;
            
        }
        
    } else if ([key isEqualToString:@"modified"]) {
        static NSDateFormatter *mdaDateFormatter = nil;
        if (mdaDateFormatter == nil) {
            mdaDateFormatter = [NSDateFormatter new];
            [mdaDateFormatter setLocale:[NSLocale currentLocale]];
            [mdaDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
        }
        
        self.modified = [mdaDateFormatter dateFromString:value];
    } else if ([key isEqualToString:@"prices"])
    {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
            {
                MDAComicPrice *populatedMember = [MDAComicPrice initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.prices = myMembers;
            
        }
        
    } else if ([key isEqualToString:@"series"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.series = [MDASeriesSummary initFromDictionary:value];
        }
    } else if ([key isEqualToString:@"textObjects"]) {
        
        if ([value isKindOfClass:[NSArray class]]) {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
            {
                MDATextObject *populatedMember = [MDATextObject initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.textObjects = myMembers;
            
        }
    } else if ([key isEqualToString:@"thumbnail"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.thumbnail = [MDAImage initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"upc"]) {
        if ([value isKindOfClass:[NSNumber class]]){
            self.upc = [value stringValue];
            
            if ([self.upc length]) {
                self.ean13 = [[self.upc substringToIndex:12] integerValue];
                self.eanSupplemental = [self.upc substringFromIndex:12];
            }
        }
        
    } else if ([key isEqualToString:@"urls"])
    {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
            {
                MDAUrl *populatedMember = [MDAUrl initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.urls = myMembers;
            
        }
        
    }  else
    {
        [super setValue:value forKey:key];
    }
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"comicId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;
    
    if (self.collectedIssues)
    {
        [dictionary setObject:self.collectedIssues forKey:@"collectedIssues"];
    }
    
    if (self.collections)
    {
        [dictionary setObject:self.collections forKey:@"collections"];
    }
    
    if (self.dates)
    {
        [dictionary setObject:self.dates forKey:@"dates"];
    }
    
    if (self.diamondCode)
    {
        [dictionary setObject:self.diamondCode forKey:@"diamondCode"];
    }
    
    [dictionary setObject:[NSNumber numberWithInteger:self.digitalId] forKey:@"digitalId"];
    
    if (self.ean)
    {
        [dictionary setObject:self.ean forKey:@"ean"];
    }
    
    if (self.format)
    {
        [dictionary setObject:self.format forKey:@"format"];
    }
    
    if (self.images)
    {
        [dictionary setObject:self.images forKey:@"images"];
    }
    
    if (self.isbn)
    {
        [dictionary setObject:self.isbn forKey:@"isbn"];
    }
    
    if (self.issn)
    {
        [dictionary setObject:self.issn forKey:@"issn"];
    }
    
    [dictionary setObject:[NSNumber numberWithInteger:self.issueNumber] forKey:@"issueNumber"];
    
    [dictionary setObject:[NSNumber numberWithInteger:self.pageCount] forKey:@"pageCount"];
    
    if (self.prices)
    {
        [dictionary setObject:self.prices forKey:@"prices"];
    }
    
    [dictionary setObject:[NSNumber numberWithInteger:self.comicId] forKey:@"comicId"];
    
    if (self.textObjects)
    {
        [dictionary setObject:self.textObjects forKey:@"textObjects"];
    }
    
    if (self.title)
    {
        [dictionary setObject:self.title forKey:@"title"];
    }
    
    if (self.upc)
    {
        [dictionary setObject:self.upc forKey:@"upc"];
    }
    
    if (self.urls)
    {
        [dictionary setObject:self.urls forKey:@"urls"];
    }
    
    if (self.variantDescription)
    {
        [dictionary setObject:self.variantDescription forKey:@"variantDescription"];
    }
    
    return dictionary;
    
}

@end
