//
//  MDATextObject.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDATextObject : NSObject

@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *type;


+ (MDATextObject *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
