//
//  MDACreator.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

/**
 *  An object to describe a creator.
 */
@interface MDACreator : MDAObject
/**
 *  The first name of the creator.
 */
@property (nonatomic, strong) NSString *firstName;
/**
 *   The full name of the creator (a space-separated concatenation of the above four fields).
 */
@property (nonatomic, strong) NSString *fullName;
/**
 *  The last name of the creator.
 */
@property (nonatomic, strong) NSString *lastName;
/**
 *  The middle name of the creator.
 */
@property (nonatomic, strong) NSString *middleName;
/**
 *  The unique ID of the creator resource.
 */
@property (nonatomic, assign) NSInteger creatorId;
/**
 *  The suffix or honorific for the creator.
 */
@property (nonatomic, strong) NSString *suffix;
/**
 *   A set of public web site URLs for the resource. These are represented by MDAUrl objects
 */
@property (nonatomic, strong) NSArray *urls;

@end
