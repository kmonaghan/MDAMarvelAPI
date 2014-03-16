//
//  MDAStory.h
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

@class MDAComicSummary;

/**
 *  An object to describe a Marvel story.
 */
@interface MDAStory : MDAObject

/**
 *  A summary representation of the issue in which this story was originally published.
 */
@property (nonatomic, strong) MDAComicSummary *originalissue;
/**
 *  The unique ID of the story resource.
 */
@property (nonatomic, strong) NSString *storyId;
/**
 *  The story title.
 */
@property (nonatomic, strong) NSString *title;
/**
 *  The story type e.g. interior story, cover, text story.
 */
@property (nonatomic, strong) NSString *type;

@end
