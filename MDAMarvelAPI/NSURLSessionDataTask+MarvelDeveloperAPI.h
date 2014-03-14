//
//  NSURLSessionDataTask+MarvelDeveloperAPI.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

@class MDACharacter;
@class MDACharacterDataContainer;
@class MDAComic;
@class MDAComicDataContainer;
@class MDACreator;
@class MDACreatorDataContainer;
@class MDAEvent;
@class MDAEventDataContainer;
@class MDASearchParameters;
@class MDASeries;
@class MDASeriesDataContainer;
@class MDAStory;
@class MDAStoryDataContainer;

/**
 This category adds methods to the `NSURLSessionDataTask` class. The methods in this category provide support for
 */
@interface NSURLSessionDataTask (MarvelDeveloperAPI)

/**
 *  Create a NSURLSessionDataTask to perform a search for Marvel characters.
 *
 *  @param search A configured search object or nil.
 *  @param block  The block to process the returned characters or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
 */
+ (NSURLSessionDataTask *)fetchCharactersWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block;

/**
 *  Create a NSURLSessionDataTask to fetch a Marvel character from a given id.
 *
 *  @param characterId The id of the character.
 *  @param block       The block to process the returned character or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)fetchCharacterWithId:(NSInteger)characterId withBlock:(void (^)(MDACharacter *character, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCharacterComicsWithId:(NSInteger)characterId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCharacterEventsWithId:(NSInteger)characterId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCharacterSeriesWithId:(NSInteger)characterId withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCharacterStoriesWithId:(NSInteger)characterId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

+ (NSURLSessionDataTask *)fetchComicsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchComicWithId:(NSInteger)comicId withBlock:(void (^)(MDAComic *comic, NSError *error))block;
+ (NSURLSessionDataTask *)fetchComicCharactersWithId:(NSInteger)comicId withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchComicCreatorsWithId:(NSInteger)comicId withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchComicEventsWithId:(NSInteger)comicId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchComicStoriesWithId:(NSInteger)comicId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

+ (NSURLSessionDataTask *)fetchCreatorsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCreatorWithId:(NSInteger)creatorId withBlock:(void (^)(MDACreator *creator, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCreatorComicsWithId:(NSInteger)creatorId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCreatorEventsWithId:(NSInteger)creatorId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCreatorSeriesWithId:(NSInteger)creatorId withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCreatorStoriesWithId:(NSInteger)creatorId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

+ (NSURLSessionDataTask *)fetchEventsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchEventWithId:(NSInteger)eventId withBlock:(void (^)(MDAEvent *event, NSError *error))block;
+ (NSURLSessionDataTask *)fetchEventCharactersWithId:(NSInteger)eventId withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchEventComicsWithId:(NSInteger)eventId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchEventCreatorsWithId:(NSInteger)eventId withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchEventSeriesWithId:(NSInteger)eventId withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchEventStoriesWithId:(NSInteger)eventId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

+ (NSURLSessionDataTask *)fetchSeriesWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchSeriesWithId:(NSInteger)seriesId withBlock:(void (^)(MDASeries *series, NSError *error))block;
+ (NSURLSessionDataTask *)fetchSeriesCharactersWithId:(NSInteger)seriesId withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchSeriesComicsWithId:(NSInteger)seriesId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchSeriesCreatorsWithId:(NSInteger)seriesId withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchSeriesEventsWithId:(NSInteger)seriesId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchSeriesStoriesWithId:(NSInteger)seriesId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

+ (NSURLSessionDataTask *)fetchStoriesWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchStoryWithId:(NSInteger)storyId withBlock:(void (^)(MDAStory *story, NSError *error))block;
+ (NSURLSessionDataTask *)fetchStoryCharactersWithId:(NSInteger)storyId withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchStoryComicsWithId:(NSInteger)storyId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchStoryCreatorsWithId:(NSInteger)storyId withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchStoryEventsWithId:(NSInteger)storyId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
+ (NSURLSessionDataTask *)fetchStorySeriesWithId:(NSInteger)storyId withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
@end
