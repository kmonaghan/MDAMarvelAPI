//
//  MDAList.h
//  MarvelPullList
//
//  Created by Karl Monaghan on 24/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAList : NSObject
@property (nonatomic, assign) NSInteger available;
@property (nonatomic, strong) NSString *collectionURI;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) NSInteger returned;


+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;
@end
