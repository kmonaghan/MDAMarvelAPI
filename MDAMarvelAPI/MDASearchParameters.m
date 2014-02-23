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
    
    if (self.format) {
        params[@"format"] = self.format;
    }
    
    if (self.formatType) {
        params[@"formatType"] = self.formatType;
    }
    
    if (self.noVariants) {
        params[@"noVariants"] = @"true";
    }
    
    if (self.dateDescriptor) {
        params[@"dateDescriptor"] = self.dateDescriptor;
    }
    
    if ([self.dateRange count]) {
        params[@"dateRange"] = [self.dateRange componentsJoinedByString:@","];
    }
    
    if (self.hasDigitalIssue) {
        params[@"hasDigitalIssue"] = @"true";
    }
    
    if (self.modifiedSince) {
        params[@"modifiedSince"] = @"true";
    }
    
    if ([self.creators count]) {
        params[@"creators"] = [self.creators componentsJoinedByString:@","];
    }
    
    if (self.characters) {
        params[@"characters"] = [self.characters componentsJoinedByString:@","];
    }
    
    if (self.series) {
        params[@"series"] = [self.series componentsJoinedByString:@","];
    }
    
    if (self.events) {
        params[@"events"] = [self.events componentsJoinedByString:@","];
    }
    
    if (self.stories) {
        params[@"stories"] = [self.stories componentsJoinedByString:@","];
    }
    
    if (self.sharedAppearances) {
        params[@"sharedAppearances"] = [self.sharedAppearances componentsJoinedByString:@","];
    }

    if (self.collaborators) {
        params[@"collaborators"] = [self.collaborators componentsJoinedByString:@","];
    }
    
    if (self.orderBy) {
        params[@"orderBy"] = self.orderBy;
    }
    
    if (self.limit) {
        params[@"limit"] = [NSNumber numberWithInteger:self.limit];
    }
    
    if (self.offset) {
        params[@"offset"] = [NSNumber numberWithInteger:self.offset];
    }
    
    if ([self.comics count]) {
        params[@"comics"] = [self.dateRange componentsJoinedByString:@","];
    }
    
    return params;
}
@end
