//
//  MDAMarvelAPIClient.h
//  Marvel API
//
//  Created by Karl Monaghan on 06/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface MDAMarvelAPIClient : AFHTTPSessionManager
+ (instancetype)sharedClient;
- (NSDictionary *)authParams;
- (void)publicKey:(NSString *)publicKey privateKey:(NSString *)privateKey;
@end
