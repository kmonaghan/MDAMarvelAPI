//
//  MDAStoryDataWrapper.m
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 skillpages. All rights reserved.
//

#import "MDAStoryDataWrapper.h"

#import "MDAStoryDataContainer.h"

@implementation MDAStoryDataWrapper

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:[NSNumber numberWithInteger:self.code] forKey:@"code"];
    [encoder encodeObject:self.data forKey:@"data"];
    [encoder encodeObject:self.etag forKey:@"etag"];
    [encoder encodeObject:self.status forKey:@"status"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init]))
    {
        self.code = [(NSNumber *)[decoder decodeObjectForKey:@"code"] integerValue];
        self.data = [decoder decodeObjectForKey:@"data"];
        self.etag = [decoder decodeObjectForKey:@"etag"];
        self.status = [decoder decodeObjectForKey:@"status"];
    }
    return self;
}

+ (MDAStoryDataWrapper *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    MDAStoryDataWrapper *instance = [[MDAStoryDataWrapper alloc] init];
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

    if ([key isEqualToString:@"data"])
    {

        if ([value isKindOfClass:[NSDictionary class]])
    {
            self.data = [MDAStoryDataContainer instanceFromDictionary:value];
        }

    } else
    {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    [dictionary setObject:[NSNumber numberWithInteger:self.code] forKey:@"code"];

    if (self.data)
    {
        [dictionary setObject:self.data forKey:@"data"];
    }

    if (self.etag)
    {
        [dictionary setObject:self.etag forKey:@"etag"];
    }

    if (self.status)
    {
        [dictionary setObject:self.status forKey:@"status"];
    }

    return dictionary;

}

@end
