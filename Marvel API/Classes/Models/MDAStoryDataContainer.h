//
//  MDAStoryDataContainer.h
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 skillpages. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAStoryDataContainer : NSObject <NSCoding>

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, assign) NSInteger total;


+ (MDAStoryDataContainer *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
