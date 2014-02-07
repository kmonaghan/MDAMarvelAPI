//
//  CBPComic.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBPCharacters;
@class CBPCreators;
@class CBPEvents;
@class CBPSeries;
@class CBPStories;
@class CBPThumbnail;

@interface CBPComic : NSObject

@property (nonatomic, strong) CBPCharacters *characters;
@property (nonatomic, strong) NSArray *collectedIssues;
@property (nonatomic, strong) NSArray *collections;
@property (nonatomic, strong) CBPCreators *creators;
@property (nonatomic, strong) NSArray *dates;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSString *diamondCode;
@property (nonatomic, assign) NSInteger digitalId;
@property (nonatomic, strong) NSString *ean;
@property (nonatomic, strong) CBPEvents *events;
@property (nonatomic, strong) NSString *format;
@property (nonatomic, assign) NSInteger comicId;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *isbn;
@property (nonatomic, strong) NSString *issn;
@property (nonatomic, assign) NSInteger issueNumber;
@property (nonatomic, strong) NSDate *modified;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, strong) NSArray *prices;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, strong) CBPSeries *series;
@property (nonatomic, strong) CBPStories *stories;
@property (nonatomic, strong) NSArray *textObjects;
@property (nonatomic, strong) CBPThumbnail *thumbnail;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *upc;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) NSString *variantDescription;
@property (nonatomic, strong) NSArray *variants;


+ (CBPComic *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
