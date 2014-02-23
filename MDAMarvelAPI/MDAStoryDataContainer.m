//
//  MDAStoryDataContainer.m
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAStoryDataContainer.h"

#import "MDAStory.h"

@implementation MDAStoryDataContainer

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:[NSNumber numberWithInteger:self.count] forKey:@"count"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.limit] forKey:@"limit"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.offset] forKey:@"offset"];
    [encoder encodeObject:self.results forKey:@"results"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.total] forKey:@"total"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init]))
    {
        self.count = [(NSNumber *)[decoder decodeObjectForKey:@"count"] integerValue];
        self.limit = [(NSNumber *)[decoder decodeObjectForKey:@"limit"] integerValue];
        self.offset = [(NSNumber *)[decoder decodeObjectForKey:@"offset"] integerValue];
        self.results = [decoder decodeObjectForKey:@"results"];
        self.total = [(NSNumber *)[decoder decodeObjectForKey:@"total"] integerValue];
    }
    return self;
}

+ (MDAStoryDataContainer *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDAStoryDataContainer *instance = [[MDAStoryDataContainer alloc] init];
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
                MDAStory *populatedMember = [MDAStory instanceFromDictionary:valueMember];
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

    [dictionary setObject:[NSNumber numberWithInteger:self.offset] forKey:@"offset"];

    if (self.results)
    {
        [dictionary setObject:self.results forKey:@"results"];
    }

    [dictionary setObject:[NSNumber numberWithInteger:self.total] forKey:@"total"];

    return dictionary;

}

@end
