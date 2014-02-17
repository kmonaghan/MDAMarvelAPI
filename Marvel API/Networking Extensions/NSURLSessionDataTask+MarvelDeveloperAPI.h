//
//  NSURLSessionDataTask+MarvelDeveloperAPI.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

@class MDACharacter;
@class MDACharacterDataWrapper;
@class MDAComic;
@class MDAComicDataWrapper;
@class MDACreator;
@class MDAEvent;
@class MDAEventDataContainer;
@class MDAEventDataWrapper;
@class MDASearchParameters;

@interface NSURLSessionDataTask (MarvelDeveloperAPI)
+ (NSURLSessionDataTask *)fetchCharacterWithId:(NSInteger)characterId withBlock:(void (^)(MDACharacter *character, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCharactersWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDACharacterDataWrapper *wrapper, NSError *error))block;
+ (NSURLSessionDataTask *)fetchComicWithId:(NSInteger)comicId withBlock:(void (^)(MDAComic *comic, NSError *error))block;
+ (NSURLSessionDataTask *)fetchComicsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAComicDataWrapper *wrapper, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCreatorWithId:(NSInteger)creatorId withBlock:(void (^)(MDACreator *comic, NSError *error))block;
+ (NSURLSessionDataTask *)fetchEventWithId:(NSInteger)eventId withBlock:(void (^)(MDAEvent *event, NSError *error))block;
+ (NSURLSessionDataTask *)fetchEventsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAEventDataWrapper *wrapper, NSError *error))block;
@end
