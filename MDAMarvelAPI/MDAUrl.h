//
//  MDAUrl.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

/**
 *  A container for URLs provided by the API.
 */
@interface MDAUrl : NSObject

/** @name Properties */

/**
 *  A text identifier for the URL.
 */
@property (nonatomic, strong) NSString *type;
/**
 *   A full URL (including scheme, domain, and path).
 */
@property (nonatomic, strong) NSString *url;

/** @name Class Methods */

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
