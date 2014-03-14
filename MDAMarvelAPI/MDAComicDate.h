//
//  MDAComicDate.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

@interface MDAComicDate : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *type;


+ (MDAComicDate *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
