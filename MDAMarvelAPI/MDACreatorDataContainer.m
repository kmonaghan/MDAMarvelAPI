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

+ (MDACreatorDataContainer *)initFromDictionary:(NSDictionary *)aDictionary
{
    
    MDACreatorDataContainer *instance = [[MDACreatorDataContainer alloc] init];
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


- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.count) {
        [dictionary setObject:self.count forKey:@"count"];
    }
    
    [dictionary setObject:[NSNumber numberWithInteger:self.limit] forKey:@"limit"];
    
    if (self.offset) {
        [dictionary setObject:self.offset forKey:@"offset"];
    }
    
    if (self.results) {
        [dictionary setObject:self.results forKey:@"results"];
    }
    
    [dictionary setObject:[NSNumber numberWithInteger:self.total] forKey:@"total"];
    
    return dictionary;
    
}

@end
