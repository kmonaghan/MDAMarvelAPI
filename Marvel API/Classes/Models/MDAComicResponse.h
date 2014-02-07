//
//  MDAComicResponse.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDAComicResponseData;

@interface MDAComicResponse : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) MDAComicResponseData *data;
@property (nonatomic, strong) NSString *etag;
@property (nonatomic, strong) NSString *status;


+ (MDAComicResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
