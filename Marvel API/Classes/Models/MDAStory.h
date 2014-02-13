//
//  MDAStory.h
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 skillpages. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDACharacterList;
@class MDAComicList;
@class MDACreatorList;
@class MDAEventList;
@class MDAComicSummary;
@class MDASeriesList;
@class MDAImage;

@interface MDAStory : NSObject <NSCoding>

@property (nonatomic, strong) MDACharacterList *characters;
@property (nonatomic, strong) MDAComicList *comics;
@property (nonatomic, strong) MDACreatorList *creators;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) MDAEventList *events;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) MDAComicSummary *originalissue;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, strong) NSString *storyId;
@property (nonatomic, strong) MDASeriesList *series;
@property (nonatomic, strong) MDAImage *thumbnail;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;


+ (MDAStory *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
