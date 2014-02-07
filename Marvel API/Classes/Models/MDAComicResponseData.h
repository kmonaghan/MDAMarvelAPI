//
//  MDAComicResponseData.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAComicResponseData : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, strong) NSNumber *offset;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, assign) NSInteger total;


+ (MDAComicResponseData *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
