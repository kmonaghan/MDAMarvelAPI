//
//  MDACreator.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDAComicList;
@class MDAEventList;
@class MDASeriesList;
@class MDAStoryList;
@class MDAImage;

@interface MDACreator : NSObject

@property (nonatomic, strong) MDAComicList *comics;
@property (nonatomic, strong) MDAEventList *events;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *middleName;
@property (nonatomic, strong) NSDate *modified;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, assign) NSInteger creatorId;
@property (nonatomic, strong) MDASeriesList *series;
@property (nonatomic, strong) MDAStoryList *stories;
@property (nonatomic, strong) NSString *suffix;
@property (nonatomic, strong) MDAImage *thumbnail;
@property (nonatomic, strong) NSArray *urls;


+ (MDACreator *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
