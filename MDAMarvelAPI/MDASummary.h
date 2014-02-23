//
//  MDASummary.h
//  Marvel API
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDASummary : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *resourceURI;

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;
- (NSInteger)resourceId;
@end
