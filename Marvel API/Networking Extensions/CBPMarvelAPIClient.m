//
//  CBPMarvelAPIClient.m
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "CBPMarvelAPIClient.h"

static NSString * const CBPMarvelAPIBaseURLString = @"http://gateway.marvel.com";

@implementation CBPMarvelAPIClient
+ (instancetype)sharedClient
{
    static CBPMarvelAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[CBPMarvelAPIClient alloc] initWithBaseURL:[NSURL URLWithString:CBPMarvelAPIBaseURLString]];
    });
    
    return _sharedClient;
}
@end
