//
//  NSURLSessionDataTask+MarvelDeveloperAPI.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAComic.h"

@class MDASearchParameters;
@class MDAComicDataWrapper;

@interface NSURLSessionDataTask (MarvelDeveloperAPI)
+ (NSURLSessionDataTask *)fetchComicWithId:(NSInteger)comicId withhBlock:(void (^)(MDAComic *comic, NSError *error))block;
+ (NSURLSessionDataTask *)fetchComicsWithSearch:(MDASearchParameters *)search withhBlock:(void (^)(MDAComicDataWrapper *data, NSError *error))block;

@end
