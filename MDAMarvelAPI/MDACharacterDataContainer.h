//
//  MDACharacterDataContainer.h
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDACharacterDataContainer : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, assign) NSInteger total;


+ (MDACharacterDataContainer *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
