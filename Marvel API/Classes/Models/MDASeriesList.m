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
    
    MDASeriesList *instance = [[MDASeriesList alloc] init];
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
                MDASeriesSummary *populatedMember = [MDASeriesSummary initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.items = myMembers;
            
        }
        
    } else {
        [super setValue:value forKey:key];
    }
    
}


- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    [dictionary setObject:[NSNumber numberWithInteger:self.available] forKey:@"available"];
    
    if (self.collectionURI) {
        [dictionary setObject:self.collectionURI forKey:@"collectionURI"];
    }
    
    if (self.items) {
        [dictionary setObject:self.items forKey:@"items"];
    }
    
    [dictionary setObject:[NSNumber numberWithInteger:self.returned] forKey:@"returned"];
    
    return dictionary;
    
}

@end
