//
//  MDACreator.m
//
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDACreator.h"

#import "MDASeriesList.h"
#import "MDAUrl.h"

@implementation MDACreator

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDACreator *instance = [MDACreator new];
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
    
    if ([key isEqualToString:@"series"])
    {
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.seriesList = [MDASeriesList initFromDictionary:value];
        }
    } else if ([key isEqualToString:@"urls"]) {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                MDAUrl *populatedMember = [MDAUrl initFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.urls = myMembers;
            
        }
        
    } else {
        [super setValue:value forKey:key];
    }
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"creatorId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;
    
    
    if (self.firstName) {
        [dictionary setObject:self.firstName forKey:@"firstName"];
    }
    
    if (self.fullName) {
        [dictionary setObject:self.fullName forKey:@"fullName"];
    }
    
    if (self.lastName) {
        [dictionary setObject:self.lastName forKey:@"lastName"];
    }
    
    if (self.middleName) {
        [dictionary setObject:self.middleName forKey:@"middleName"];
    }
    
    [dictionary setObject:[NSNumber numberWithInteger:self.creatorId] forKey:@"creatorId"];
    
    if (self.suffix) {
        [dictionary setObject:self.suffix forKey:@"suffix"];
    }
    
    if (self.urls) {
        [dictionary setObject:self.urls forKey:@"urls"];
    }
    
    return dictionary;
}

@end
