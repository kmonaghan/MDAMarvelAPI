//
//  MDASeriesList.m
//
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASeriesList.h"

#import "MDASeriesSummary.h"

@implementation MDASeriesList

+ (MDASeriesList *)initFromDictionary:(NSDictionary *)aDictionary
{
    MDASeriesList *instance = [MDASeriesList new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"items"]) {
        if ([value isKindOfClass:[NSArray class]]){
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                MDASeriesSummary *populatedMember = [MDASeriesSummary initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.items = myMembers;
        }
    } else {
        [super setValue:value forKey:key];
    }
}

@end
