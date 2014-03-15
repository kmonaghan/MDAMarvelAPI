//
//  MDAComicDate.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

/**
 *  A date container.
 */
@interface MDAComicDate : NSObject

/**
 *  The date.
 */
@property (nonatomic, strong) NSDate *date;
/**
 *  A description of the date (e.g. onsale date, FOC date).
 */
@property (nonatomic, strong) NSString *type;


+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
