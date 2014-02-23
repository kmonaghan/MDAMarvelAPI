//
//  MDAComicDataContainer.m
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAComicDataContainer.h"

#import "MDAComic.h"

@implementation MDAComicDataContainer

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAComicDataContainer *instance = [[MDAComicDataContainer alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"results"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                MDAComic *populatedMember = [MDAComic initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.results = myMembers;
        }
    } else {
        [super setValue:value forKey:key];
    }
}

@end
