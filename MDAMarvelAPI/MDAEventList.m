//
//  MDAEventList.m
//
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAEventList.h"

#import "MDAEventSummary.h"

@implementation MDAEventList

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAEventList *instance = [MDAEventList new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    
    if ([key isEqualToString:@"items"]) {
        if ([value isKindOfClass:[NSArray class]]){
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                MDAEventSummary *populatedMember = [MDAEventSummary initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.items = myMembers;
        }
    } else {
        [super setValue:value forKey:key];
    }
}

@end
