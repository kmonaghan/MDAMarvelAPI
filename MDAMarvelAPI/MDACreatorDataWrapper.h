//
//  MDACreatorDataWrapper.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDACreatorDataContainer;

@interface MDACreatorDataWrapper : NSObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) MDACreatorDataContainer *data;
@property (nonatomic, strong) NSString *etag;
@property (nonatomic, strong) NSString *status;


+ (MDACreatorDataWrapper *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
