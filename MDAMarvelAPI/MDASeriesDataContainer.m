//
//  MDASeriesDataContainer.m
//
//
//  Created by Karl Monaghan on 22/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASeriesDataContainer.h"

#import "MDASeries.h"

@implementation MDASeriesDataContainer

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDASeriesDataContainer *instance = [[MDASeriesDataContainer alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"results"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                MDASeries *populatedMember = [MDASeries initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.results = myMembers;
        }
    } else {
        [super setValue:value forKey:key];
    }
}

@end
