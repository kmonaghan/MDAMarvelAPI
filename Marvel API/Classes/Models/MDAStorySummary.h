//
//  MDAStorySummary.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDAStorySummary : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *type;


+ (MDAStorySummary *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
