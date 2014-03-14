//
//  MDACharacter.h
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

@class MDAImage;

/**
 *  A representation of a Marvel charater
 */
@interface MDACharacter : MDAObject
/**
 *  A short bio or description of the character.
 */
@property (nonatomic, strong) NSString *descriptionText;
/**
 * The unique ID of the character resource.
 */
@property (nonatomic, strong) NSString *characterId;
/**
 *  The name of the character.
 */
@property (nonatomic, strong) NSString *name;
/**
 *  The representative image for this character.
 */
@property (nonatomic, strong) MDAImage *thumbnail;
/**
 *  A set of public web site URLs for the resource.
 */
@property (nonatomic, strong) NSArray *urls;

@end
