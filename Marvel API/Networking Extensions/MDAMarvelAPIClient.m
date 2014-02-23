//
//  MDAMarvelAPIClient.m
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "MDAMarvelAPIClient.h"

static NSString * const CBPMarvelAPIBaseURLString = @"http://gateway.marvel.com";

@implementation MDAMarvelAPIClient
+ (instancetype)sharedClient
{
    static MDAMarvelAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MDAMarvelAPIClient alloc] initWithBaseURL:[NSURL URLWithString:CBPMarvelAPIBaseURLString]];
        [_sharedClient.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    });
    
    return _sharedClient;
}

- (NSDictionary *)authParams
{
    NSString *timestamp = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
    
    const char *ptr = [[NSString stringWithFormat:@"%@%@%@", timestamp, CBPMarvelAPIPrivateKey, CBPMarvelAPIPublicKey] UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, (int)strlen(ptr), md5Buffer);
    
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x",md5Buffer[i]];
    }
    
    return @{@"ts": timestamp, @"apikey": CBPMarvelAPIPublicKey, @"hash": hash};
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:nil];
    
    request.cachePolicy = NSURLRequestReloadRevalidatingCacheData;
    
    NSLog(@"Request Headers: %@", [request allHTTPHeaderFields]);
    
    __block NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
        
        NSLog(@"URL: %@", [[task currentRequest].URL absoluteString]);
        NSLog(@"Response Headers: %@", [[task currentRequest] allHTTPHeaderFields]);
        NSLog(@"Response Code: %ld", (long)((NSHTTPURLResponse *)[task response]).statusCode);
        
        if (error) {
            if (failure) {
                failure(task, error);
            }
        } else {
            if (success) {
                NSLog(@"responseObject: %@", responseObject);
                
                success(task, responseObject);
            }
        }
    }];
    
    [task resume];
    
    return task;
}
@end
