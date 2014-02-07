//
//  CBPComicResponseData.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPComicResponseData.h"

#import "CBPComic.h"

@implementation CBPComicResponseData

+ (CBPComicResponseData *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    CBPComicResponseData *instance = [[CBPComicResponseData alloc] init];
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

    if ([key isEqualToString:@"results"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                CBPComic *populatedMember = [CBPComic instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.results = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


@end
