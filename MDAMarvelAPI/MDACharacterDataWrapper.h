//
//  MDACharacterDataWrapper.h
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDACharacterDataContainer;

@interface MDACharacterDataWrapper : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) MDACharacterDataContainer *data;
@property (nonatomic, strong) NSString *etag;
@property (nonatomic, strong) NSString *status;


+ (MDACharacterDataWrapper *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
