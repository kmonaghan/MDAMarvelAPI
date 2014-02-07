//
//  MDAComicResponseData.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAComicResponseData.h"

#import "MDAComic.h"

@implementation MDAComicResponseData

+ (MDAComicResponseData *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDAComicResponseData *instance = [[MDAComicResponseData alloc] init];
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

    if ([key isEqualToString:@"results"])
    {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value)
    {
                MDAComic *populatedMember = [MDAComic instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.results = myMembers;

        }

    } else
    {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    [dictionary setObject:[NSNumber numberWithInteger:self.count] forKey:@"count"];

    [dictionary setObject:[NSNumber numberWithInteger:self.limit] forKey:@"limit"];

    if (self.offset)
    {
        [dictionary setObject:self.offset forKey:@"offset"];
    }

    if (self.results)
    {
        [dictionary setObject:self.results forKey:@"results"];
    }

    [dictionary setObject:[NSNumber numberWithInteger:self.total] forKey:@"total"];

    return dictionary;

}

@end
