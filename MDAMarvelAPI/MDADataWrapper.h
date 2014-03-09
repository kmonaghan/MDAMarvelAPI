//
//  MDADataWrapper.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

@interface MDADataWrapper : NSObject

@property (nonatomic, strong) NSString *attributionText;
@property (nonatomic, strong) NSString *attributionHTML;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *copyright;
@property (nonatomic, strong) NSString *etag;
@property (nonatomic, strong) NSString *status;

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
