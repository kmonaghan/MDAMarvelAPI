//
//  MDAThumbnail.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAThumbnail : NSObject

@property (nonatomic, strong) NSString *extension;
@property (nonatomic, strong) NSString *path;


+ (MDAThumbnail *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
