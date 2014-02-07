//
//  MDAStoriesCollectionURI.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAStoriesCollectionURI : NSObject

@property (nonatomic, assign) NSInteger storiesCollectionURIId;
@property (nonatomic, strong) NSString *service;


+ (MDAStoriesCollectionURI *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
