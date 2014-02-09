//
//  MDAComicDataWrapper.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDAComicDataContainer;

@interface MDAComicDataWrapper : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) MDAComicDataContainer *data;
@property (nonatomic, strong) NSString *etag;
@property (nonatomic, strong) NSString *status;


+ (MDAComicDataWrapper *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
