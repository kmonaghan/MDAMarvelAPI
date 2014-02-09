//
//  NSURLSessionDataTask+MarvelDeveloperAPI.m
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "NSURLSessionDataTask+MarvelDeveloperAPI.h"

#import "MDASearchParameters.h"

#import "MDAComicDataWrapper.h"

@implementation NSURLSessionDataTask (MarvelDeveloperAPI)
+ (NSURLSessionDataTask *)fetchComicWithId:(NSInteger)comicId withhBlock:(void (^)(MDAComic *comic, NSError *error))block
{
    return [[CBPMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/comics/%ld", (long)comicId] parameters:[[CBPMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"JSON: %@", JSON);
        
        NSArray *comicsWithResponse = [JSON valueForKeyPath:@"data"][@"results"];
        
        MDAComic *comic = [MDAComic instanceFromDictionary:comicsWithResponse[0]];
        
        if (block) {
            block(comic, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchComicsWithSearch:(MDASearchParameters *)search withhBlock:(void (^)(MDAComicDataWrapper *wrapper, NSError *error))block
{
    NSMutableDictionary *params = [[CBPMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[CBPMarvelAPIClient sharedClient] GET:@"/v1/public/comics" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAComicDataWrapper *container = [MDAComicDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(container, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

@end
