//
//  CBPStories.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPStories.h"

#import "CBPURI.h"
#import "CBPSummary.h"

@implementation CBPStories

+ (CBPStories *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    CBPStories *instance = [[CBPStories alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key
{

    if ([key isEqualToString:@"collectionURI"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.collectionURI = [CBPURI instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"items"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                CBPSummary *populatedMember = [CBPSummary instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.items = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


@end
