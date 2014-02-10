//
//  MDAImage.m
//  
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAImage.h"

@implementation MDAImage

+ (MDAImage *)initFromDictionary:(NSDictionary *)aDictionary
{

    MDAImage *instance = [[MDAImage alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.extension) {
        [dictionary setObject:self.extension forKey:@"extension"];
    }

    if (self.path) {
        [dictionary setObject:self.path forKey:@"path"];
    }

    return dictionary;

}

- (NSURL *)imageForResolution:(MDAImageResolution)resolution
{
    NSString *resolutionName = @"";
    
    switch (resolution) {
        case MDAImageResolutionPortraitSmall:
            resolutionName = @"/portrait_small";
            break;
        case MDAImageResolutionPortraitMedium:
            resolutionName = @"/portrait_medium";
            break;
        case MDAImageResolutionPortraitXlarge:
            resolutionName = @"/portrait_xlarge";
            break;
        case MDAImageResolutionPortraitFantastic:
            resolutionName = @"/portrait_fantastic";
            break;
        case MDAImageResolutionPortraitUncanny:
            resolutionName = @"/portrait_uncanny";
            break;
        case MDAImageResolutionPortraitIncredible:
            resolutionName = @"/portrait_incredible";
            break;
        case MDAImageResolutionStandardSmall:
            resolutionName = @"/standard_small";
            break;
        case MDAImageResolutionStandardMedium:
            resolutionName = @"/standard_medium";
            break;
        case MDAImageResolutionStandardLarge:
            resolutionName = @"/standard_large";
            break;
        case MDAImageResolutionStandardXlarge:
            resolutionName = @"/standard_xlarge";
            break;
        case MDAImageResolutionStandardFantastic:
            resolutionName = @"/standard_fantastic";
            break;
        case MDAImageResolutionStandardAmazing:
            resolutionName = @"/standard_amazing";
            break;
        case MDAImageResolutionLandscapeSmall:
            resolutionName = @"/landscape_small";
            break;
        case MDAImageResolutionLandscapeMedium:
            resolutionName = @"/landscape_medium";
            break;
        case MDAImageResolutionLandscapeLarge:
            resolutionName = @"/landscape_large";
            break;
        case MDAImageResolutionLandscapeXlarge:
            resolutionName = @"/landscape_xlarge";
            break;
        case MDAImageResolutionLandscapeAmazing:
            resolutionName = @"/landscape_amazing";
            break;
        case MDAImageResolutionLandscapeIncredible:
            resolutionName = @"/landscape_incredible";
            break;
        case MDAImageResolutionDetail:
            resolutionName = @"/detail";
            break;
        case MDAImageResolutionFull:
            resolutionName = @"";
            break;
        default:
            break;
    }
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@.%@", self.path, resolutionName,self.extension]];
}
@end
