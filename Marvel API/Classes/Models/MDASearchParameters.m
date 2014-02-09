//
//  MDASearchParameters.m
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDASearchParameters.h"

@implementation MDASearchParameters
- (NSDictionary *)parameters
{
    NSMutableDictionary *params = @{}.mutableCopy;
    
    if (self.dateDescriptor) {
        params[@"dateDescriptor"] = self.dateDescriptor;
    }
    
    return params;
}
@end
