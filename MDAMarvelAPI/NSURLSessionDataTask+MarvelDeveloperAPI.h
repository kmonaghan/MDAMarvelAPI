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
 *  This category adds methods to the `NSURLSessionDataTask` class. The methods in this category provide support for fetching results from the Marvel Developer API.
 *  
 *  There are six types of items that can be retrieved from the Marvel API - characters, comics, creators, events, series and stories. Each item has an associated unique id that can be used to fetch related items.
 *
 *  #Searching#
 *
 *  To search for items, you need to provide a configured `MDASearchParameter` object. Each successful search returns an appropriate subclass of `MDADataContainer` via a block.
 *
 *  Possible error responses from a search:
 *  
 *  - 409	Limit greater than 100.
 *  - 409	Limit invalid or below 1.
 *  - 409	Invalid or unrecognized parameter.
 *  - 409	Empty parameter.
 *  - 409	Invalid or unrecognized ordering parameter.
 *  - 409	Too many values sent to a multi-value list filter.
 *  - 409	Invalid value passed to filter.
 *
 *  #Retrieving a single item#
 *
 *  If you have the unique id of an item, you can easily retrieve it using the appropriate helper method ofr that item. The item will be returned via a block.
 *
 *  Possible error responses from a search:
 *
 *  - 404   Item not found
 *
 *  #Retrieving related items#
 *
 *  There are helper methods for each item to retrieve items of the other five types that are associated with the orginal item. E.G. for each comic you can retrieve all the characters, creators, events, series and stories. An optional search filter can be passed to the methods to fetch particular results.
 *
 */
@interface NSURLSessionDataTask (MarvelDeveloperAPI)

/** @name Characters */

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
 *
 *  @see http://developer.marvel.com/docs#!/public/getCharacterIndividual_get_1
 */
+ (NSURLSessionDataTask *)fetchCharacterWithId:(NSInteger)characterId withBlock:(void (^)(MDACharacter *character, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel comics with a given character from a character id.
 *
 *  @param characterId The id of the character.
 *  @param filter      Optional filter.
 *  @param block       The block to process the returned comics or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getComicsCharacterCollection_get_2
 */
+ (NSURLSessionDataTask *)fetchCharacterComicsWithId:(NSInteger)characterId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel events with a given character from a character id.
 *
 *  @param characterId The id of the character.
 *  @param filter      Optional filter.
 *  @param block       The block to process the returned events or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCharacterEventsCollection_get_3
 */
+ (NSURLSessionDataTask *)fetchCharacterEventsWithId:(NSInteger)characterId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel events with a given character from a character id.
 *
 *  @param characterId The id of the character.
 *  @param filter      Optional filter.
 *  @param block       The block to process the returned series or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCharacterSeriesCollection_get_4
 */
+ (NSURLSessionDataTask *)fetchCharacterSeriesWithId:(NSInteger)characterId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel stories with a given character from a character id.
 *
 *  @param characterId The unique id of the character.
 *  @param filter      Optional filter.
 *  @param block       The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCharacterStoryCollection_get_5
 */
+ (NSURLSessionDataTask *)fetchCharacterStoriesWithId:(NSInteger)characterId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

/** @name Comics */

/**
 *  Create a NSURLSessionDataTask to fetch MArvel comics matching a search.
 *
 *  @param search   A configured search object or nil.
 *  @param block    The block to process the returned comics or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getComicsCollection_get_6
 */
+ (NSURLSessionDataTask *)fetchComicsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch a given comic from a comic id.
 *
 *  @param comicId  The unique id of the comic.
 *  @param block    The block to process the returned comic or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getComicIndividual_get_7
 */
+ (NSURLSessionDataTask *)fetchComicWithId:(NSInteger)comicId withBlock:(void (^)(MDAComic *comic, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel characters associated with a given comic from a comic id.
 *
 *  @param comicId  The unique id of the comic.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned characters or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *  
 *  @see http://developer.marvel.com/docs#!/public/getComicCharacterCollection_get_8
 */
+ (NSURLSessionDataTask *)fetchComicCharactersWithId:(NSInteger)comicId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel creators associated with a given comic from a comic id.
 *
 *  @param comicId  The unique id of the comic.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned creators or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorCollection_get_9
 */
+ (NSURLSessionDataTask *)fetchComicCreatorsWithId:(NSInteger)comicId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel events with a given comic from a comic id.
 *
 *  @param comicId  The unique id of the comic.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned series or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getIssueEventsCollection_get_10
 */
+ (NSURLSessionDataTask *)fetchComicEventsWithId:(NSInteger)comicId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel stories with a given comic from a comic id.
 *
 *  @param comicId  The unique id of the comic.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getComicStoryCollection_get_11
 */
+ (NSURLSessionDataTask *)fetchComicStoriesWithId:(NSInteger)comicId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

/** @name Creators */

/**
 *  Find Marvel creators based on a search.
 *
 *  @param search   A configured search object or nil.
 *  @param block    The block to process the returned creators or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorCollection_get_12
 */
+ (NSURLSessionDataTask *)fetchCreatorsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
/**
 *  Fetch a particular Marvel creator.
 *
 *  @param creatorId The unique id of the creator to fetch.
 *  @param block    The block to process the returned comic or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorIndividual_get_13
 */
+ (NSURLSessionDataTask *)fetchCreatorWithId:(NSInteger)creatorId withBlock:(void (^)(MDACreator *creator, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel comics associated with a given creator from an unique creator id.
 *
 *  @param creatorId  The unique id of the creator.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned comics or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getComicsCollection_get_14
 */
+ (NSURLSessionDataTask *)fetchCreatorComicsWithId:(NSInteger)creatorId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel events associated with a given creator from an unique creator id.
 *
 *  @param creatorId  The unique id of the creator.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned events or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorEventsCollection_get_15
 */
+ (NSURLSessionDataTask *)fetchCreatorEventsWithId:(NSInteger)creatorId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel series associated with a given creator from an unique creator id.
 *
 *  @param creatorId  The unique id of the creator.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned serles or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorSeriesCollection_get_16
 */
+ (NSURLSessionDataTask *)fetchCreatorSeriesWithId:(NSInteger)creatorId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel stories associated with a given creator from an unique creator id.
 *
 *  @param creatorId  The unique id of the creator.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorStoryCollection_get_17
 */
+ (NSURLSessionDataTask *)fetchCreatorStoriesWithId:(NSInteger)creatorId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

/** @name Events */

/**
 *  Find Marvel events based on a search.
 *
 *  @param search   A configured search object or nil.
 *  @param block    The block to process the returned events or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getEventsCollection_get_18
 */
+ (NSURLSessionDataTask *)fetchEventsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
/**
 *  Fetch a particular Marvel event.
 *
 *  @param eventId The unique id of the event to fetch.
 *  @param block    The block to process the returned event or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getEventIndividual_get_19
 */
+ (NSURLSessionDataTask *)fetchEventWithId:(NSInteger)eventId withBlock:(void (^)(MDAEvent *event, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel characters associated with a given event from an unique event id.
 *
 *  @param eventId  The unique id of the event.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned characters or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getEventCharacterCollection_get_20
 */
+ (NSURLSessionDataTask *)fetchEventCharactersWithId:(NSInteger)eventId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel comics associated with a given event from an unique event id.
 *
 *  @param eventId  The unique id of the event.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned comics or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getComicsCollection_get_21
 */
+ (NSURLSessionDataTask *)fetchEventComicsWithId:(NSInteger)eventId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel comics associated with a given event from an unique event id.
 *
 *  @param eventId  The unique id of the event.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned comics or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorCollection_get_22
 */
+ (NSURLSessionDataTask *)fetchEventCreatorsWithId:(NSInteger)eventId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel comics associated with a given event from an unique event id.
 *
 *  @param eventId  The unique id of the event.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned comics or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getEventSeriesCollection_get_23
 */
+ (NSURLSessionDataTask *)fetchEventSeriesWithId:(NSInteger)eventId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel stories associated with a given event from an unique event id.
 *
 *  @param eventId  The unique id of the event.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getEventStoryCollection_get_24
 */
+ (NSURLSessionDataTask *)fetchEventStoriesWithId:(NSInteger)eventId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

/** @name Series */

/**
 *  Find Marvel series based upon a search.
 *
 *  @param search   A configured search object or nil.
 *  @param block    The block to process the returned series or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getSeriesCollection_get_25
 */
+ (NSURLSessionDataTask *)fetchSeriesWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
/**
 *  Fetch a particular Marvel series.
 *
 *  @param seriesId The unique id of the series to fetch.
 *  @param block    The block to process the returned series or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getSeriesIndividual_get_26
 */
+ (NSURLSessionDataTask *)fetchSeriesWithId:(NSInteger)seriesId withBlock:(void (^)(MDASeries *series, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel stories associated with a given series from an unique series id.
 *
 *  @param seriesId  The unique id of the series.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getSeriesCharacterWrapper_get_27
 */
+ (NSURLSessionDataTask *)fetchSeriesCharactersWithId:(NSInteger)seriesId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel stories associated with a given series from an unique series id.
 *
 *  @param seriesId  The unique id of the series.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getComicsCollection_get_28
 */
+ (NSURLSessionDataTask *)fetchSeriesComicsWithId:(NSInteger)seriesId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel stories associated with a given series from an unique series id.
 *
 *  @param seriesId  The unique id of the series.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorCollection_get_29
 */
+ (NSURLSessionDataTask *)fetchSeriesCreatorsWithId:(NSInteger)seriesId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel stories associated with a given series from an unique series id.
 *
 *  @param seriesId  The unique id of the series.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getEventsCollection_get_30
 */
+ (NSURLSessionDataTask *)fetchSeriesEventsWithId:(NSInteger)seriesId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel stories associated with a given series from an unique series id.
 *
 *  @param seriesId  The unique id of the series.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getSeriesStoryCollection_get_31
 */
+ (NSURLSessionDataTask *)fetchSeriesStoriesWithId:(NSInteger)seriesId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;

/** @name Stories */

/**
 *  Find Marvel stories based upon a search.
 *
 *  @param search   A configured search object or nil.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getStoryCollection_get_32
 */
+ (NSURLSessionDataTask *)fetchStoriesWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block;
/**
 *  Fetch a particular Marvel story.
 *
 *  @param storyId The unique id of the story to fetch.
 *  @param block    The block to process the returned series or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getStoryIndividual_get_33
 */
+ (NSURLSessionDataTask *)fetchStoryWithId:(NSInteger)storyId withBlock:(void (^)(MDAStory *story, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel characters associated with a given story from an unique story id.
 *
 *  @param storyId  The unique id of the story.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorCollection_get_34
 */
+ (NSURLSessionDataTask *)fetchStoryCharactersWithId:(NSInteger)storyId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel comics associated with a given story from an unique story id.
 *
 *  @param storyId  The unique id of the story.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getComicsCollection_get_35
 */
+ (NSURLSessionDataTask *)fetchStoryComicsWithId:(NSInteger)storyId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel creators associated with a given story from an unique story id.
 *
 *  @param storyId  The unique id of the story.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getCreatorCollection_get_36
 */
+ (NSURLSessionDataTask *)fetchStoryCreatorsWithId:(NSInteger)storyId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel events associated with a given story from an unique story id.
 *
 *  @param storyId  The unique id of the story.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getEventsCollection_get_37
 */
+ (NSURLSessionDataTask *)fetchStoryEventsWithId:(NSInteger)storyId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block;
/**
 *  Create a NSURLSessionDataTask to fetch the Marvel series associated with a given story from an unique story id.
 *
 *  @param storyId  The unique id of the story.
 *  @param filter   Optional filter.
 *  @param block    The block to process the returned stories or possible error.
 *
 *  @return The newly initialized NSURLSessionDataTask
 *
 *  @see http://developer.marvel.com/docs#!/public/getStorySeriesCollection_get_38
 */
+ (NSURLSessionDataTask *)fetchStorySeriesWithId:(NSInteger)storyId withFilter:(MDASearchParameters *)filter withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block;
@end
