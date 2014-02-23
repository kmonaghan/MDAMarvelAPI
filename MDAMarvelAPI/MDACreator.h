//
//  MDACreator.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

@class MDAImage;

@interface MDACreator : MDAObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *middleName;
@property (nonatomic, strong) NSDate *modified;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, assign) NSInteger creatorId;
@property (nonatomic, strong) NSString *suffix;
@property (nonatomic, strong) MDAImage *thumbnail;
@property (nonatomic, strong) NSArray *urls;

@end
