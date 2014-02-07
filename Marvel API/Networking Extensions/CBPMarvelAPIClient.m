//
//  CBPMarvelAPIClient.m
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
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

- (NSDictionary *)authParams
{
    NSString *timestamp = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
    
    const char *ptr = [[NSString stringWithFormat:@"%@%@%@", timestamp, CBPMarvelAPIPrivateKey, CBPMarvelAPIPublicKey] UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x",md5Buffer[i]];
    }
    
    return @{@"ts": timestamp, @"apikey": CBPMarvelAPIPublicKey, @"hash": hash};
}
@end
