//
//  CBPURI.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBPURI : NSObject

@property (nonatomic, assign) NSInteger URIid;
@property (nonatomic, strong) NSString *service;


+ (CBPURI *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
