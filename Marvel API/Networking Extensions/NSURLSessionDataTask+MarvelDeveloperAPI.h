//
//  NSURLSessionDataTask+MarvelDeveloperAPI.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAComic.h"

@interface NSURLSessionDataTask (MarvelDeveloperAPI)
+ (NSURLSessionDataTask *)fetchComicWithId:(NSInteger)comicId withhBlock:(void (^)(MDAComic *comic, NSError *error))block;
@end
