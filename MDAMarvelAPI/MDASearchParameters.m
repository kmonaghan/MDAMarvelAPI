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
    
    if (self.characters) {
        params[@"characters"] = [self.characters componentsJoinedByString:@","];
    }
    
    if (self.collaborators) {
        params[@"collaborators"] = [self.collaborators componentsJoinedByString:@","];
    }
    
    if ([self.comics count]) {
        params[@"comics"] = [self.comics componentsJoinedByString:@","];
    }

    if (self.contains) {
        params[@"contains"] = self.contains;
    }
    
    if ([self.creators count]) {
        params[@"creators"] = [self.creators componentsJoinedByString:@","];
    }
    
    if (self.dateDescriptor) {
        params[@"dateDescriptor"] = self.dateDescriptor;
    }
    
    if ([self.dateRange count]) {
        params[@"dateRange"] = [self.dateRange componentsJoinedByString:@","];
    }
    
    if (self.diamondCode) {
        params[@"diamondCode"] = self.diamondCode;
    }
    
    if (self.digitalId) {
        params[@"digitalId"] = self.digitalId;
    }
    
    if (self.ean) {
        params[@"ean"] = self.ean;
    }
    
    if (self.events) {
        params[@"events"] = [self.events componentsJoinedByString:@","];
    }
    
    if (self.firstName) {
        params[@"firstName"] = self.firstName;
    }
    
    if (self.firstNameStartsWith) {
        params[@"firstNameStartsWith"] = self.firstNameStartsWith;
    }
    
    if (self.format) {
        params[@"format"] = self.format;
    }
    
    if (self.formatType) {
        params[@"formatType"] = self.formatType;
    }
    
    if (self.hasDigitalIssue) {
        params[@"hasDigitalIssue"] = @"true";
    }
    
    if (self.isbn) {
        params[@"isbn"] = self.isbn;
    }
    
    if (self.issn) {
        params[@"issn"] = self.issn;
    }
    
    if (self.issueNumber) {
        params[@"issueNumber"] = [NSNumber numberWithInteger:self.issueNumber];
    }
    
    if (self.lastName) {
        params[@"lastName"] = self.lastName;
    }
    
    if (self.lastNameStartsWith) {
        params[@"lastNameStartsWith"] = self.lastNameStartsWith;
    }
    
    if (self.limit) {
        params[@"limit"] = [NSNumber numberWithInteger:self.limit];
    }
    
    if (self.middleName) {
        params[@"middleName"] = self.middleName;
    }
    
    if (self.middleNameStartsWith) {
        params[@"middleNameStartsWith"] = self.middleNameStartsWith;
    }
    
    if (self.modifiedSince) {
        params[@"modifiedSince"] = @"true";
    }
    
    if (self.name) {
        params[@"name"] = self.name;
    }
    
    if (self.nameStartsWith) {
        params[@"nameStartsWith"] = self.nameStartsWith;
    }
    
    if (self.noVariants) {
        params[@"noVariants"] = @"true";
    }
    
    if (self.offset) {
        params[@"offset"] = [NSNumber numberWithInteger:self.offset];
    }
    
    if (self.orderBy) {
        params[@"orderBy"] = self.orderBy;
    }
    
    if (self.series) {
        params[@"series"] = [self.series componentsJoinedByString:@","];
    }
    
    if (self.seriesType) {
        params[@"seriesType"] = self.seriesType;
    }
    
    if (self.sharedAppearances) {
        params[@"sharedAppearances"] = [self.sharedAppearances componentsJoinedByString:@","];
    }
    
    if (self.startYear) {
        params[@"startYear"] = [NSNumber numberWithInteger:self.startYear];
    }
    
    if (self.stories) {
        params[@"stories"] = [self.stories componentsJoinedByString:@","];
    }

    if (self.title) {
        params[@"title"] = self.title;
    }
    
    if (self.titleStartsWith) {
        params[@"titleStartsWith"] = self.titleStartsWith;
    }
    
    if (self.upc) {
        params[@"upc"] = self.upc;
    }
    
    return params;
}
@end
