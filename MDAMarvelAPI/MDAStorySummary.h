//
//  MDAStorySummary.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASummary.h"

/**
 *  A summary of a Marvel story.
 */
@interface MDAStorySummary : MDASummary

@property (nonatomic, strong) NSString *role;
/**
 *  The type of the story (interior or cover).
 */
@property (nonatomic, strong) NSString *type;

@end
