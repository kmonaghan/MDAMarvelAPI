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

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAStoryDataContainer *instance = [[MDAStoryDataContainer alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
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
                MDAStory *populatedMember = [MDAStory initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.results = myMembers;
            
        }
    } else {
        [super setValue:value forKey:key];
    }
}

@end
