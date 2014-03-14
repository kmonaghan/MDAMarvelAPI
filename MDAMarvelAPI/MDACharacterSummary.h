//
//  MDACharacterSummary.h
//  Marvel API
//
//  Created by Karl Monaghan on 13/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASummary.h"

/**
 *  A summary of a Marvel character.
 */
@interface MDACharacterSummary : MDASummary
/**
 *  The role of the creator in the parent entity.
 */
@property (nonatomic, strong) NSString *role;
@end
