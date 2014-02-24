//
//  MDAComicPrice.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAComicPrice : NSObject

@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *type;


+ (MDAComicPrice *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
