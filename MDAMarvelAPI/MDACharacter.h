//
//  MDACharacter.h
//  
//
//  Created by Karl Monaghan on 15/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

@class MDAImage;

/**
 *  A representation of a Marvel charater
 */
@interface MDACharacter : MDAObject

@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) MDAEventList *events;
@property (nonatomic, strong) NSString *characterId;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, strong) MDAImage *thumbnail;
@property (nonatomic, strong) NSArray *urls;

@end
