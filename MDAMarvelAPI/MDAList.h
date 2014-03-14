//
//  MDAList.h
//  MarvelPullList
//
//  Created by Karl Monaghan on 24/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

/**
 *  A root class for all the Marvel lists.
 */
@interface MDAList : NSObject
/**
 *  The number of total available items in this list. Will always be greater than or equal to the "returned" value.
 */
@property (nonatomic, assign) NSInteger available;
/**
 *  The path to the full list of items in this collection.
 */
@property (nonatomic, strong) NSString *collectionURI;
/**
 *  The list of returned items in this collection.
 */
@property (nonatomic, strong) NSArray *items;
/**
 *   The number of items returned in this collection (up to 20).
 */
@property (nonatomic, assign) NSInteger returned;


+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;
@end
