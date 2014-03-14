//
//  MDADataWrapper.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

/**
 *  A root class for all data wrapper objects.
 */
@interface MDADataWrapper : NSObject

/**
 *  The attribution notice for this result. Please display either this notice or the contents of the attributionHTML field on all screens which contain data from the Marvel Comics API.
 */
@property (nonatomic, strong) NSString *attributionText;
/**
 *  An HTML representation of the attribution notice for this result. Please display either this notice or the contents of the attributionText field on all screens which contain data from the Marvel Comics API.
 */
@property (nonatomic, strong) NSString *attributionHTML;
/**
 *  The HTTP status code of the returned result.
 */
@property (nonatomic, assign) NSInteger code;
/**
 *  The copyright notice for the returned result.
 */
@property (nonatomic, strong) NSString *copyright;
/**
 *  A digest value of the content returned by the call.
 */
@property (nonatomic, strong) NSString *etag;
/**
 *   A string description of the call status.
 */
@property (nonatomic, strong) NSString *status;

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
