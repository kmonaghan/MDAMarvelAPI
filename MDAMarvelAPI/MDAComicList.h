//
//  MDAComicList.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAComicList : NSObject

@property (nonatomic, assign) NSInteger available;
@property (nonatomic, strong) NSString *collectionURI;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) NSInteger returned;


+ (MDAComicList *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
