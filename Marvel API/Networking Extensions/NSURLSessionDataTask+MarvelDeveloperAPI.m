//
//  NSURLSessionDataTask+MarvelDeveloperAPI.m
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "NSURLSessionDataTask+MarvelDeveloperAPI.h"

#import "MDASearchParameters.h"

#import "MDACharacterDataContainer.h"
#import "MDACharacterDataWrapper.h"
#import "MDAComic.h"
#import "MDAComicDataContainer.h"
#import "MDAComicDataWrapper.h"
#import "MDACreator.h"
#import "MDACreatorDataWrapper.h"
#import "MDACreatorDataContainer.h"
#import "MDAEvent.h"
#import "MDAEventDataContainer.h"
#import "MDAEventDataWrapper.h"

@implementation NSURLSessionDataTask (MarvelDeveloperAPI)

+ (NSURLSessionDataTask *)fetchCharacterWithId:(NSInteger)characterId withBlock:(void (^)(MDACharacter *character, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/characters/%ld", (long)characterId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACharacterDataWrapper *container = [MDACharacterDataWrapper initFromDictionary:JSON];

        if (block && container.data.count) {
            block(container.data.results[0], nil);
        } else {
            block(nil, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchCharactersWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDACharacterDataWrapper *wrapper, NSError *error))block
{
    NSMutableDictionary *params = [[MDAMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[MDAMarvelAPIClient sharedClient] GET:@"/v1/public/characters" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        MDACharacterDataWrapper *container = [MDACharacterDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(container, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchComicWithId:(NSInteger)comicId withBlock:(void (^)(MDAComic *comic, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/comics/%ld", (long)comicId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAComicDataWrapper *container = [MDAComicDataWrapper initFromDictionary:JSON];
        
        if (block && container.data.count) {
            block(container.data.results[0], nil);
        } else {
            block(nil, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchComicsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAComicDataWrapper *wrapper, NSError *error))block
{
    NSMutableDictionary *params = [[MDAMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[MDAMarvelAPIClient sharedClient] GET:@"/v1/public/comics" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {

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

+ (NSURLSessionDataTask *)fetchCreatorWithId:(NSInteger)creatorId withBlock:(void (^)(MDACreator *comic, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/creators/%ld", (long)creatorId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACreatorDataWrapper *container = [MDACreatorDataWrapper initFromDictionary:JSON];
        
        if (block && container.data.total) {
            block(container.data.results[0], nil);
        } else {
           block(nil, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchEventWithId:(NSInteger)eventId withBlock:(void (^)(MDAEvent *event, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/events/%ld", (long)eventId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAEventDataWrapper *container = [MDAEventDataWrapper initFromDictionary:JSON];
        
        if (block && container.data.count) {
            block(container.data.results[0], nil);
        } else {
            block(nil, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchEventsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAEventDataWrapper *wrapper, NSError *error))block
{
    NSMutableDictionary *params = [[MDAMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[MDAMarvelAPIClient sharedClient] GET:@"/v1/public/events" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAEventDataWrapper *container = [MDAEventDataWrapper initFromDictionary:JSON];
        
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
