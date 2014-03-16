//
//  MDAImage.h
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

typedef NS_ENUM(NSInteger, MDAImageResolution) {
    MDAImageResolutionPortraitSmall       = 1,	//50x75px
    MDAImageResolutionPortraitMedium      = 2,	//100x150px
    MDAImageResolutionPortraitXlarge      = 3,	//150x225px
    MDAImageResolutionPortraitFantastic   = 4,	//168x252px
    MDAImageResolutionPortraitUncanny     = 5,  //300x450px
    MDAImageResolutionPortraitIncredible  = 6,	//216x324px
    MDAImageResolutionStandardSmall       = 7,	//65x45px
    MDAImageResolutionStandardMedium      = 8,	//100x100px
    MDAImageResolutionStandardLarge       = 9,	//140x140px
    MDAImageResolutionStandardXlarge      = 10,	//200x200px
    MDAImageResolutionStandardFantastic   = 11,	//250x250px
    MDAImageResolutionStandardAmazing     = 12, //180x180px
    MDAImageResolutionLandscapeSmall      = 13, //120x90px
    MDAImageResolutionLandscapeMedium     = 14,	//175x30px
    MDAImageResolutionLandscapeLarge      = 15,	//190x140px
    MDAImageResolutionLandscapeXlarge     = 16,	//270x200px
    MDAImageResolutionLandscapeAmazing    = 17,	//250x156px
    MDAImageResolutionLandscapeIncredible = 18,	//464x261px
    MDAImageResolutionDetail              = 19, //500xUnconstrained
    MDAImageResolutionFull                = 20
};

/**
 *  This object contains the details of an available image.
 *
 *  To obtain an image URL you must use the imageForResolution: method, passing through the desired size of image.
 */
@interface MDAImage : NSObject

/**
 *  The file extension for the image.
 */
@property (nonatomic, strong) NSString *extension;
/**
 *  The directory path of to the image.
 */
@property (nonatomic, strong) NSString *path;

+ (MDAImage *)initFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;
- (NSURL *)imageForResolution:(MDAImageResolution)resolution;
@end
