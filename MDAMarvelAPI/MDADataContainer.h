//
//  MDADataContainer.h
//  Marvel API
//
//  Created by Karl Monaghan on 23/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

/**
 *  A root class for all the data containers.
 *
 *  Each of the child classes creates the correct objects to put into the results array.
 */
@interface MDADataContainer : NSObject <NSCoding>

/**
 *  The total number of results returned by this call.
 */
@property (nonatomic, assign) NSInteger count;
/**
 *  The requested result limit.
 */
@property (nonatomic, assign) NSInteger limit;
/**
 *  The requested offset (number of skipped results) of the call.
 */
@property (nonatomic, assign) NSInteger offset;
/**
 *  The list of objects returned by the call.
 */
@property (nonatomic, strong) NSArray *results;
/**
 *  The total number of resources available given the current filter set.
 */
@property (nonatomic, assign) NSInteger total;

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
