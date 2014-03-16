//
//  MDAStory.h
//  
//
//  Created by Karl Monaghan on 12/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

@class MDAComicSummary;
@class MDASeriesList;
@class MDAImage;

/**
 *  An object to describe a Marvel story.
 */
@interface MDAStory : MDAObject

@property (nonatomic, strong) MDAComicSummary *originalissue;
@property (nonatomic, strong) NSString *storyId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;

@end
