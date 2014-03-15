//
//  MDAComicPrice.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

/**
 *  A container for price details.
 */
@interface MDAComicPrice : NSObject

/**
 *  The price (all prices in USD).
 */
@property (nonatomic, strong) NSString *price;
/**
 *   A description of the price (e.g. print price, digital price).
 */
@property (nonatomic, strong) NSString *type;


+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
