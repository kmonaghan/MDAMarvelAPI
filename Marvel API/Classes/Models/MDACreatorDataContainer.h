//
//  MDACreatorDataContainer.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDACreatorDataContainer : NSObject

@property (nonatomic, strong) NSString *count;
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, strong) NSString *offset;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, assign) NSInteger total;


+ (MDACreatorDataContainer *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
