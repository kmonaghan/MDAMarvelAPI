//
//  MDASummary.m
//  Marvel API
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASummary.h"

@implementation MDASummary
+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary
{
    MDASummary *instance = [[MDASummary alloc] init];
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

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }
    
    if (self.resourceURI) {
        [dictionary setObject:self.resourceURI forKey:@"resourceURI"];
    }
    
    return dictionary;
}

//TODO - this assumes all URIs are in the form: http://gateway.marvel.com/v1/public/{RESOURCE TYPE}/{RESOURCE ID}
//It's probably a bit brittle...
- (NSInteger)resourceId
{
    NSArray *components = [self.resourceURI componentsSeparatedByString:@"/"];
    
    return [components[6] integerValue];
}

@end
