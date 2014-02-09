//
//  MDAComicSummary.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAComicSummary : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, strong) NSString *type;


+ (MDAComicSummary *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
