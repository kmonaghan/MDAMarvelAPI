//
//  MDACharacter.h
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

/**
 *  A representation of a Marvel charater
 */
@interface MDACharacter : MDAObject
/**
 * The unique ID of the character resource.
 */
@property (nonatomic, strong) NSString *characterId;
/**
 *  The name of the character.
 */
@property (nonatomic, strong) NSString *name;
/**
 *  A set of public web site URLs for the resource.
 */
@property (nonatomic, strong) NSArray *urls;

@end
