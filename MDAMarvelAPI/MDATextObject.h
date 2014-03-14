//
//  MDATextObject.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

/**
 *  A blob of text.
 */
@interface MDATextObject : NSObject
/**
 *  The IETF language tag denoting the language the text object is written in.
 */
@property (nonatomic, strong) NSString *language;
/**
 *  The text.
 */
@property (nonatomic, strong) NSString *text;
/**
 *  The canonical type of the text object (e.g. solicit text, preview text, etc.).
 */
@property (nonatomic, strong) NSString *type;


+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
