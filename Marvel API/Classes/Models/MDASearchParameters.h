//
//  MDASearchParameters.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

@interface MDASearchParameters : NSObject
@property (strong, nonatomic) NSString *format;
@property (strong, nonatomic) NSString *formatType;
@property (assign, nonatomic) BOOL noVariants;
@property (strong, nonatomic) NSString *dateDescriptor;
@property (strong, nonatomic) NSArray *dateRange;
@property (assign, nonatomic) BOOL hasDigitalIssue;
@property (strong, nonatomic) NSDate *modifiedSince;
@property (strong, nonatomic) NSArray *creators;
@property (strong, nonatomic) NSArray *characters;
@property (strong, nonatomic) NSArray *series;
@property (strong, nonatomic) NSArray *events;
@property (strong, nonatomic) NSArray *stories;
@property (strong, nonatomic) NSArray *sharedAppearances;
@property (strong, nonatomic) NSArray *collaborators;
@property (strong, nonatomic) NSString *orderBy;
@property (assign, nonatomic) NSInteger limit;
@property (assign, nonatomic) NSInteger offset;

- (NSDictionary *)parameters;
@end
