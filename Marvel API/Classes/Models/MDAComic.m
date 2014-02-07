//
//  MDAComic.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAComic.h"

#import "MDACharacters.h"
#import "MDACreators.h"
#import "MDADate.h"
#import "MDAEvents.h"
#import "MDAImage.h"
#import "MDAPrice.h"
#import "MDASeries.h"
#import "MDAStories.h"
#import "MDATextObject.h"
#import "MDAThumbnail.h"
#import "MDAUrl.h"
#import "MDAVariant.h"

@implementation MDAComic

+ (MDAComic *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDAComic *instance = [[MDAComic alloc] init];
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
            self.characters = [MDACharacters instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"collectedIssues"])
    {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
    {
                [myMembers addObject:valueMember];
            }

            self.collectedIssues = myMembers;

        }

    } else if ([key isEqualToString:@"collections"])
    {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
    {
                [myMembers addObject:valueMember];
            }

            self.collections = myMembers;

        }

    } else if ([key isEqualToString:@"creators"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.creators = [MDACreators instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"dates"])
    {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
    {
                MDADate *populatedMember = [MDADate instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.dates = myMembers;

        }

    } else if ([key isEqualToString:@"events"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.events = [MDAEvents instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"images"])
    {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
    {
                MDAImage *populatedMember = [MDAImage instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.images = myMembers;

        }

    } else if ([key isEqualToString:@"prices"])
    {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
    {
                MDAPrice *populatedMember = [MDAPrice instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.prices = myMembers;

        }

    } else if ([key isEqualToString:@"series"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.series = [MDASeries instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"stories"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.stories = [MDAStories instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"textObjects"])
    {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
    {
                MDATextObject *populatedMember = [MDATextObject instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.textObjects = myMembers;

        }

    } else if ([key isEqualToString:@"thumbnail"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.thumbnail = [MDAThumbnail instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"urls"])
    {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
    {
                MDAUrl *populatedMember = [MDAUrl instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.urls = myMembers;

        }

    } else if ([key isEqualToString:@"variants"])
    {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
    {
                MDAVariant *populatedMember = [MDAVariant instanceFromDictionary:valueMember];
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

    if ([key isEqualToString:@"description"])
    {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"id"])
    {
        [self setValue:value forKey:@"comicId"];
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

    if (self.collectedIssues)
    {
        [dictionary setObject:self.collectedIssues forKey:@"collectedIssues"];
    }

    if (self.collections)
    {
        [dictionary setObject:self.collections forKey:@"collections"];
    }

    if (self.creators)
    {
        [dictionary setObject:self.creators forKey:@"creators"];
    }

    if (self.dates)
    {
        [dictionary setObject:self.dates forKey:@"dates"];
    }

    if (self.descriptionText)
    {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
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

    if (self.events)
    {
        [dictionary setObject:self.events forKey:@"events"];
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

    if (self.modified)
    {
        [dictionary setObject:self.modified forKey:@"modified"];
    }

    [dictionary setObject:[NSNumber numberWithInteger:self.pageCount] forKey:@"pageCount"];

    if (self.prices)
    {
        [dictionary setObject:self.prices forKey:@"prices"];
    }

    if (self.resourceURI)
    {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }

    [dictionary setObject:[NSNumber numberWithInteger:self.comicId] forKey:@"comicId"];

    if (self.series)
    {
        [dictionary setObject:self.series forKey:@"series"];
    }

    if (self.stories)
    {
        [dictionary setObject:self.stories forKey:@"stories"];
    }

    if (self.textObjects)
    {
        [dictionary setObject:self.textObjects forKey:@"textObjects"];
    }

    if (self.thumbnail)
    {
        [dictionary setObject:self.thumbnail forKey:@"thumbnail"];
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

    if (self.variants)
    {
        [dictionary setObject:self.variants forKey:@"variants"];
    }

    return dictionary;

}

#pragma mark -
+ (NSURLSessionDataTask *)comic:(NSInteger)comicId withhBlock:(void (^)(MDAComic *comic, NSError *error))block
{
    return [[CBPMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/comics/%d", comicId] parameters:[[CBPMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON: %@", JSON);
        
        NSArray *comicsWithResponse = [JSON valueForKeyPath:@"data"][@"results"];

        MDAComic *comic = [MDAComic instanceFromDictionary:comicsWithResponse[0]];
        
        if (block) {
            block(comic, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}
@end
