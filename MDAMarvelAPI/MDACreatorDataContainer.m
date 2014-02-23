//
//  MDACreatorDataContainer.m
//
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACreatorDataContainer.h"

#import "MDACreator.h"

@implementation MDACreatorDataContainer

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDACreatorDataContainer *instance = [[MDACreatorDataContainer alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"results"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[(NSArray *)value count]];
            for (id valueMember in value) {
                MDACreator *populatedMember = [MDACreator initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.results = myMembers;
        }
    } else {
        [super setValue:value forKey:key];
    }
}

@end
