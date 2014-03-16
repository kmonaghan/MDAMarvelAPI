//
//  MDAEvent.m
//
//
//  Created by Karl Monaghan on 17/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAEvent.h"

#import "MDAEventSummary.h"
#import "MDASeriesList.h"
#import "MDAUrl.h"

@implementation MDAEvent

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDAEvent *instance = [MDAEvent new];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"next"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.next = [MDAEventSummary initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"previous"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.previous = [MDAEventSummary initFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"series"]) {
        if ([value isKindOfClass:[NSDictionary class]]) {
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
        [self setValue:value forKey:@"eventId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
    
}

- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dictionary = [super dictionaryRepresentation].mutableCopy;

    if (self.end) {
        [dictionary setObject:self.end forKey:@"end"];
    }
    
    if (self.eventId) {
        [dictionary setObject:self.eventId forKey:@"eventId"];
    }
    
    if (self.next) {
        [dictionary setObject:self.next forKey:@"next"];
    }
    
    if (self.previous) {
        [dictionary setObject:self.previous forKey:@"previous"];
    }
    
    if (self.start) {
        [dictionary setObject:self.start forKey:@"start"];
    }
    
    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }
    
    if (self.urls) {
        [dictionary setObject:self.urls forKey:@"urls"];
    }
    
    return dictionary;
}

@end
