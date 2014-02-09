//
//  MDAImage.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAImage : NSObject

@property (nonatomic, strong) NSString *extension;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSURL *url;

+ (MDAImage *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
