//
//  MDACreatorSummary.h
//  
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASummary.h"

/**
 *  A summary of a Marvel creator.
 */
@interface MDACreatorSummary : MDASummary

/**
 *  The role of the creator in the parent entity.
 */
@property (nonatomic, strong) NSString *role;

@end
