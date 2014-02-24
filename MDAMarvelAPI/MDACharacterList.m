//
//  MDACharacterList.m
//
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACharacterList.h"

#import "MDACharacterSummary.h"

@implementation MDACharacterList

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDACharacterList *instance = [MDACharacterList new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"items"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                MDACharacterSummary *populatedMember = [MDACharacterSummary initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.items = myMembers;
        }
    } else {
        [super setValue:value forKey:key];
    }
}

@end
