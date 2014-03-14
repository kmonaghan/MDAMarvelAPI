//
//  MDAObject.h
//  Marvel API
//
//  Created by Karl Monaghan on 13/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

@class MDACharacterList;
@class MDAComicList;
@class MDACreatorList;
@class MDAEventList;
@class MDASeriesList;
@class MDASeriesSummary;
@class MDAStoryList;

/**
 *  A generic object for the other objects to inherit from.
 */
@interface MDAObject : NSObject
@property (nonatomic, strong) MDACharacterList *characters;
@property (nonatomic, strong) MDAComicList *comics;
@property (nonatomic, strong) MDACreatorList *creators;
@property (nonatomic, strong) MDAEventList *events;
/**
 *  The canonical URL identifier for this resource.
 */
@property (nonatomic, strong) NSDate *modified;
/**
 *  The canonical URL identifier for this resource.
 */
@property (nonatomic, strong) NSString *resourceURI;
@property (nonatomic, strong) MDASeriesSummary *series;
@property (nonatomic, strong) MDASeriesList *seriesList;
/**
 *  A resource list of stories in which this item appears.
 */
@property (nonatomic, strong) MDAStoryList *stories;
@property (nonatomic, strong) NSArray *variants;

/**
 *  Create a new instance of the class using the given dictionary
 *
 *  @param aDictionary The variables to set
 *
 *  @return A new instance of the class
 */
+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;

/**
 *  <#Description#>
 *
 *  @param aDictionary The atrributes to set
 */
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

/**
 *  Create a dictionary containing the details of the
 *
 *  @return The filled out dictionary
 */
- (NSDictionary *)dictionaryRepresentation;
@end
