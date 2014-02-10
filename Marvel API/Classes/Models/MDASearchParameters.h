//
//  MDASearchParameters.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

@interface MDASearchParameters : NSObject
@property (strong, nonatomic) NSArray *characters;
@property (strong, nonatomic) NSArray *collaborators;
@property (strong, nonatomic) NSArray *creators;
@property (strong, nonatomic) NSString *dateDescriptor;
@property (strong, nonatomic) NSArray *dateRange;
@property (strong, nonatomic) NSArray *events;
@property (strong, nonatomic) NSString *format;
@property (strong, nonatomic) NSString *formatType;
@property (assign, nonatomic) BOOL hasDigitalIssue;
@property (assign, nonatomic) NSInteger limit;
@property (strong, nonatomic) NSDate *modifiedSince;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) BOOL noVariants;
@property (strong, nonatomic) NSArray *series;
@property (strong, nonatomic) NSArray *stories;
@property (strong, nonatomic) NSArray *sharedAppearances;
@property (assign, nonatomic) NSInteger offset;
@property (strong, nonatomic) NSString *orderBy;

- (NSDictionary *)parameters;

@end
