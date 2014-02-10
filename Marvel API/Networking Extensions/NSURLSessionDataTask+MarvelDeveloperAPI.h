//
//  NSURLSessionDataTask+MarvelDeveloperAPI.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

@class MDASearchParameters;
@class MDAComicDataWrapper;
@class MDAComic;
@class MDACreator;

@interface NSURLSessionDataTask (MarvelDeveloperAPI)
+ (NSURLSessionDataTask *)fetchComicWithId:(NSInteger)comicId withBlock:(void (^)(MDAComic *comic, NSError *error))block;
+ (NSURLSessionDataTask *)fetchComicsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAComicDataWrapper *wrapper, NSError *error))block;
+ (NSURLSessionDataTask *)fetchCreatorWithId:(NSInteger)creatorId withBlock:(void (^)(MDACreator *comic, NSError *error))block;
@end
