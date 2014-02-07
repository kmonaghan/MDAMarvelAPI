//
//  CBPPrice.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBPPrice : NSObject

@property (nonatomic, assign) CGFloat price;
@property (nonatomic, strong) NSString *type;


+ (CBPPrice *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
