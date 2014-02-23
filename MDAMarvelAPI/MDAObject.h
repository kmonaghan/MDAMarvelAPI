//
//  MDAObject.h
//  Marvel API
//
//  Created by Karl Monaghan on 13/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDACharacterList;
@class MDAComicList;
@class MDACreatorList;
@class MDAEventList;
@class MDASeriesList;
@class MDASeriesSummary;
@class MDAStoryList;

@interface MDAObject : NSObject
@property (nonatomic, strong) MDACharacterList *characters;
@property (nonatomic, strong) MDAComicList *comics;
@property (nonatomic, strong) MDACreatorList *creators;
@property (nonatomic, strong) MDAEventList *events;
@property (nonatomic, strong) MDASeriesSummary *series;
@property (nonatomic, strong) MDASeriesList *seriesList;
@property (nonatomic, strong) MDAStoryList *stories;
@property (nonatomic, strong) NSArray *variants;

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;
@end
