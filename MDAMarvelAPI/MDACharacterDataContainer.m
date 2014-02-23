//
//  MDACharacterDataContainer.m
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACharacterDataContainer.h"

#import "MDACharacter.h"

@implementation MDACharacterDataContainer

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDACharacterDataContainer *instance = [[MDACharacterDataContainer alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"results"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                MDACharacter *populatedMember = [MDACharacter initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.results = myMembers;
        }
    } else {
        [super setValue:value forKey:key];
    }
}

@end
