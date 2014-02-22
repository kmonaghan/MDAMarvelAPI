//
//  MDASeries.h
//  
//
//  Created by Karl Monaghan on 22/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDACharacterList;
@class MDAComicList;
@class MDACreatorList;
@class MDAEventList;
@class MDASeriesSummary;
@class MDAStoryList;
@class MDAImage;

@interface MDASeries : NSObject

@property (nonatomic, strong) MDACharacterList *characters;
@property (nonatomic, strong) MDAComicList *comics;
@property (nonatomic, strong) MDACreatorList *creators;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, assign) NSInteger endYear;
@property (nonatomic, strong) MDAEventList *events;
@property (nonatomic, strong) NSString *seriesId;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) MDASeriesSummary *next;
@property (nonatomic, strong) MDASeriesSummary *previous;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, assign) NSInteger startYear;
@property (nonatomic, strong) MDAStoryList *stories;
@property (nonatomic, strong) MDAImage *thumbnail;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *urls;


+ (MDASeries *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
