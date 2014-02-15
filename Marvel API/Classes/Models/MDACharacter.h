//
//  MDACharacter.h
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDAComicList;
@class MDAEventList;
@class MDASeriesList;
@class MDAStoryList;
@class MDAImage;

@interface MDACharacter : NSObject

@property (nonatomic, strong) MDAComicList *comics;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) MDAEventList *events;
@property (nonatomic, strong) NSString *characterId;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, strong) MDASeriesList *series;
@property (nonatomic, strong) MDAStoryList *stories;
@property (nonatomic, strong) MDAImage *thumbnail;
@property (nonatomic, strong) NSArray *urls;


+ (MDACharacter *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
