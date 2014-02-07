//
//  MDAComic.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDACharacters;
@class MDACreators;
@class MDAEvents;
@class MDASeries;
@class MDAStories;
@class MDAThumbnail;

@interface MDAComic : NSObject

@property (nonatomic, strong) MDACharacters *characters;
@property (nonatomic, strong) NSArray *collectedIssues;
@property (nonatomic, strong) NSArray *collections;
@property (nonatomic, strong) MDACreators *creators;
@property (nonatomic, strong) NSArray *dates;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSString *diamondCode;
@property (nonatomic, assign) NSInteger digitalId;
@property (nonatomic, strong) NSString *ean;
@property (nonatomic, strong) MDAEvents *events;
@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *isbn;
@property (nonatomic, strong) NSString *issn;
@property (nonatomic, assign) NSInteger issueNumber;
@property (nonatomic, strong) NSDate *modified;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, strong) NSArray *prices;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, assign) NSInteger comicId;
@property (nonatomic, strong) MDASeries *series;
@property (nonatomic, strong) MDAStories *stories;
@property (nonatomic, strong) NSArray *textObjects;
@property (nonatomic, strong) MDAThumbnail *thumbnail;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *upc;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) NSString *variantDescription;
@property (nonatomic, strong) NSArray *variants;


+ (MDAComic *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

+ (NSURLSessionDataTask *)comic:(NSInteger)comicId withhBlock:(void (^)(MDAComic *comic, NSError *error))block;
@end
