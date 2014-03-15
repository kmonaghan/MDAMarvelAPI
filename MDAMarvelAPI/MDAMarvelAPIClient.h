//
//  MDAMarvelAPIClient.h
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "AFHTTPSessionManager.h"

/**
 *  A session manager to access the Marvel API.
 */
@interface MDAMarvelAPIClient : AFHTTPSessionManager
+ (instancetype)sharedClient;
/**
 *  Returns the parameteres needed for each request to the API.
 *
 *  @return dictionary with keys representing the paramter names.
 */
- (NSDictionary *)authParams;
/**
 *  Set the public and private keys to use for all requests.
 *
 *  @param publicKey    Your Marvel API public key.
 *  @param privateKey   Your Marvel API private key.
 *
 *  @see https://developer.marvel.com/documentation/authorization
 */
- (void)publicKey:(NSString *)publicKey privateKey:(NSString *)privateKey;
@end
