//
//  MDAEvent.h
//  
//
//  Created by Karl Monaghan on 17/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDACharacterList;
@class MDAComicList;
@class MDACreatorList;
@class MDAEventSummary;
@class MDASeriesList;
@class MDAStoryList;
@class MDAImage;

@interface MDAEvent : NSObject

@property (nonatomic, strong) MDACharacterList *characters;
@property (nonatomic, strong) MDAComicList *comics;
@property (nonatomic, strong) MDACreatorList *creators;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSDate *end;
@property (nonatomic, strong) NSString *eventId;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) MDAEventSummary *next;
@property (nonatomic, strong) MDAEventSummary *previous;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, strong) MDASeriesList *series;
@property (nonatomic, strong) NSDate *start;
@property (nonatomic, strong) MDAStoryList *stories;
@property (nonatomic, strong) MDAImage *thumbnail;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *urls;


+ (MDAEvent *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
