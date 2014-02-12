//
//  MDAStoryDataWrapper.h
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 skillpages. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDAStoryDataContainer;

@interface MDAStoryDataWrapper : NSObject <NSCoding>

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) MDAStoryDataContainer *data;
@property (nonatomic, strong) NSString *etag;
@property (nonatomic, strong) NSString *status;


+ (MDAStoryDataWrapper *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
