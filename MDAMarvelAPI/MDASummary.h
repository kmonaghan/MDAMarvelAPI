//
//  MDASummary.h
//  Marvel API
//
//  Created by Karl Monaghan on 10/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

/**
 *  A root class for all the summary objects.
 *
 *  Many of the Marvel objects contain lists of related objects, e.g. a comic will contain a list of creators associated with it. Rather than having the full object in the list there is instead a summary object which contains enough information to
 */
@interface MDASummary : NSObject
/**
 *  The full name of the resource.
 */
@property (nonatomic, strong) NSString *name;
/**
 *  The path to the individual resource.
 */
@property (nonatomic, strong) NSString *resourceURI;

+ (instancetype)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
- (NSDictionary *)dictionaryRepresentation;

/**
 *  Get the unique id needed to fetch the full object.
 *
 *  The summary objects do not have the resource id by default. It is actually contained within the resourceURI and needs to be extracted out.
 *
 *  @return The unique id used to fetch the full object
 */
- (NSInteger)resourceId;
@end
