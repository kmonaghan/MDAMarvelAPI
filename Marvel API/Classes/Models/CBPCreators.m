//
//  CBPCreators.m
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPCreators.h"

#import "CBPCreator.h"

@implementation CBPCreators

+ (CBPCreators *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    CBPCreators *instance = [[CBPCreators alloc] init];
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

    if ([key isEqualToString:@"items"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                CBPCreator *populatedMember = [CBPCreator instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.items = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


@end
