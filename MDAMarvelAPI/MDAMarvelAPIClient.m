//
//  MDAMarvelAPIClient.m
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "AFURLRequestSerialization.h"

#import "MDAMarvelAPIClient.h"

static NSString * const CBPMarvelAPIBaseURLString = @"http://gateway.marvel.com";

@interface MDAMarvelAPIClient()
@property (strong, nonatomic) NSString *privateKey;
@property (strong, nonatomic) NSString *publicKey;
@end

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
    NSAssert(self.publicKey, @"No public key");
    NSAssert(self.privateKey, @"No private key");
    
    NSString *timestamp = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
    
    const char *ptr = [[NSString stringWithFormat:@"%@%@%@", timestamp, self.privateKey, self.publicKey] UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, (int)strlen(ptr), md5Buffer);
    
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x",md5Buffer[i]];
    }
    
    return @{@"ts": timestamp, @"apikey": self.publicKey, @"hash": hash};
}

- (void)publicKey:(NSString *)publicKey privateKey:(NSString *)privateKey
{
    self.publicKey = publicKey;
    self.privateKey = privateKey;
}
@end
