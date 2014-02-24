//
//  MDAStoryDataWrapper.m
//
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAStoryDataWrapper.h"

#import "MDAStoryDataContainer.h"

@implementation MDAStoryDataWrapper

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAStoryDataWrapper *instance = [MDAStoryDataWrapper new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"data"])
    {
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.data = [MDAStoryDataContainer initFromDictionary:value];
        }
        
    } else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;
    
    if (self.data)
    {
        [dictionary setObject:self.data forKey:@"data"];
    }
    
    return dictionary;
}

@end
