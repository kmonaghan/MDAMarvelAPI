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
#import "MDAStory.h"
#import "MDAStoryDataContainer.h"
#import "MDAStoryDataWrapper.h"
#import "MDASeries.h"
#import "MDASeriesDataContainer.h"
#import "MDASeriesDataWrapper.h"

@implementation NSURLSessionDataTask (MarvelDeveloperAPI)

+ (NSURLSessionDataTask *)fetchCharactersWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block
{
    NSMutableDictionary *params = [[MDAMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[MDAMarvelAPIClient sharedClient] GET:@"/v1/public/characters" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        MDACharacterDataWrapper *wrapper = [MDACharacterDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

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

+ (NSURLSessionDataTask *)fetchCharacterComicsWithId:(NSInteger)characterId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/characters/%ld/comics", (long)characterId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAComicDataWrapper *wrapper = [MDAComicDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchCharacterEventsWithId:(NSInteger)characterId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/characters/%ld/events", (long)characterId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAEventDataWrapper *wrapper = [MDAEventDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchCharacterSeriesWithId:(NSInteger)characterId withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/characters/%ld/series", (long)characterId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDASeriesDataWrapper *wrapper = [MDASeriesDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchCharacterStoriesWithId:(NSInteger)characterId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/characters/%ld/stories", (long)characterId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAStoryDataWrapper *wrapper = [MDAStoryDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchComicsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block
{
    NSMutableDictionary *params = [[MDAMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[MDAMarvelAPIClient sharedClient] GET:@"/v1/public/comics" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAComicDataWrapper *wrapper = [MDAComicDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
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

+ (NSURLSessionDataTask *)fetchComicCharactersWithId:(NSInteger)comicId withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/comics/%ld/characters", (long)comicId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACharacterDataWrapper *wrapper = [MDACharacterDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchComicCreatorsWithId:(NSInteger)comicId withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/comics/%ld/creators", (long)comicId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACreatorDataWrapper *wrapper = [MDACreatorDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchComicEventsWithId:(NSInteger)comicId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/comics/%ld/events", (long)comicId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAEventDataWrapper *wrapper = [MDAEventDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchComicStoriesWithId:(NSInteger)comicId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/comics/%ld/stories", (long)comicId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAStoryDataWrapper *wrapper = [MDAStoryDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchCreatorsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block
{
    NSMutableDictionary *params = [[MDAMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[MDAMarvelAPIClient sharedClient] GET:@"/v1/public/creators" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACreatorDataWrapper *wrapper = [MDACreatorDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchCreatorWithId:(NSInteger)creatorId withBlock:(void (^)(MDACreator *creator, NSError *error))block
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

+ (NSURLSessionDataTask *)fetchCreatorComicsWithId:(NSInteger)creatorId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/creators/%ld/comics", (long)creatorId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAComicDataWrapper *wrapper = [MDAComicDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchCreatorEventsWithId:(NSInteger)creatorId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/creators/%ld/events", (long)creatorId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAEventDataWrapper *wrapper = [MDAEventDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchCreatorSeriesWithId:(NSInteger)creatorId withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/creators/%ld/series", (long)creatorId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDASeriesDataWrapper *wrapper = [MDASeriesDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchCreatorStoriesWithId:(NSInteger)creatorId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/creators/%ld/stories", (long)creatorId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAStoryDataWrapper *wrapper = [MDAStoryDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchEventsWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block
{
    NSMutableDictionary *params = [[MDAMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[MDAMarvelAPIClient sharedClient] GET:@"/v1/public/events" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAEventDataWrapper *wrapper = [MDAEventDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
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

+ (NSURLSessionDataTask *)fetchEventCharactersWithId:(NSInteger)eventId withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/events/%ld/characters", (long)eventId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACharacterDataWrapper *wrapper = [MDACharacterDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchEventComicsWithId:(NSInteger)eventId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/events/%ld/comics", (long)eventId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAComicDataWrapper *wrapper = [MDAComicDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchEventCreatorsWithId:(NSInteger)eventId withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/events/%ld/creators", (long)eventId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACreatorDataWrapper *wrapper = [MDACreatorDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchEventSeriesWithId:(NSInteger)eventId withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/events/%ld/series", (long)eventId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDASeriesDataWrapper *wrapper = [MDASeriesDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchEventStoriesWithId:(NSInteger)eventId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/events/%ld/stories", (long)eventId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAStoryDataWrapper *wrapper = [MDAStoryDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchSeriesWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block
{
    NSMutableDictionary *params = [[MDAMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[MDAMarvelAPIClient sharedClient] GET:@"/v1/public/series" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDASeriesDataWrapper *wrapper = [MDASeriesDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchSeriesWithId:(NSInteger)seriesId withBlock:(void (^)(MDASeries *series, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/series/%ld", (long)seriesId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDASeriesDataWrapper *wrapper = [MDASeriesDataWrapper initFromDictionary:JSON];
        
        if (block && wrapper.data.count) {
            block(wrapper.data.results[0], nil);
        } else {
            block(nil, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchSeriesCharactersWithId:(NSInteger)seriesId withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/series/%ld/characters", (long)seriesId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACharacterDataWrapper *wrapper = [MDACharacterDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchSeriesComicsWithId:(NSInteger)seriesId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/series/%ld/comics", (long)seriesId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAComicDataWrapper *wrapper = [MDAComicDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchSeriesCreatorsWithId:(NSInteger)seriesId withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/series/%ld/creators", (long)seriesId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACreatorDataWrapper *wrapper = [MDACreatorDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchSeriesEventsWithId:(NSInteger)seriesId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/series/%ld/events", (long)seriesId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAEventDataWrapper *wrapper = [MDAEventDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchSeriesStoriesWithId:(NSInteger)seriesId withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/series/%ld/stories", (long)seriesId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAStoryDataWrapper *wrapper = [MDAStoryDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchStoriesWithSearch:(MDASearchParameters *)search withBlock:(void (^)(MDAStoryDataContainer *data, NSError *error))block
{
    NSMutableDictionary *params = [[MDAMarvelAPIClient sharedClient] authParams].mutableCopy;
    
    if (search) {
        [params addEntriesFromDictionary:[search parameters]];
    }
    
    return [[MDAMarvelAPIClient sharedClient] GET:@"/v1/public/stories" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAStoryDataWrapper *wrapper = [MDAStoryDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchStoryWithId:(NSInteger)storyId withBlock:(void (^)(MDAStory *story, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/stories/%ld", (long)storyId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAStoryDataWrapper *container = [MDAStoryDataWrapper initFromDictionary:JSON];
        
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

+ (NSURLSessionDataTask *)fetchStoryCharactersWithId:(NSInteger)storyId withBlock:(void (^)(MDACharacterDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/stories/%ld/characters", (long)storyId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACharacterDataWrapper *wrapper = [MDACharacterDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchStoryComicsWithId:(NSInteger)storyId withBlock:(void (^)(MDAComicDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/stories/%ld/comics", (long)storyId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAComicDataWrapper *wrapper = [MDAComicDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchStoryCreatorsWithId:(NSInteger)storyId withBlock:(void (^)(MDACreatorDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/stories/%ld/creators", (long)storyId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDACreatorDataWrapper *wrapper = [MDACreatorDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchStoryEventsWithId:(NSInteger)storyId withBlock:(void (^)(MDAEventDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/stories/%ld/events", (long)storyId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDAEventDataWrapper *wrapper = [MDAEventDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)fetchStorySeriesWithId:(NSInteger)storyId withBlock:(void (^)(MDASeriesDataContainer *data, NSError *error))block
{
    return [[MDAMarvelAPIClient sharedClient] GET:[NSString stringWithFormat:@"/v1/public/stories/%ld/series", (long)storyId] parameters:[[MDAMarvelAPIClient sharedClient] authParams] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        MDASeriesDataWrapper *wrapper = [MDASeriesDataWrapper initFromDictionary:JSON];
        
        if (block) {
            block(wrapper.data, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}
@end
