//
//  MDAComic.h
//  
//
//  Created by Karl Monaghan on 07/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

#import "MDAObject.h"

/**
 *  An object to describe a Marvel comic.
 */
@interface MDAComic : MDAObject

/**
 *  A list of issues collected in this comic (will generally be empty for periodical formats such as "comic" or "magazine". These are represented by MDAComicSummary objects.
 */
@property (nonatomic, strong) NSArray *collectedIssues;
/**
 *  A list of collections which include this comic (will generally be empty if the comic's format is a collection). These are represented by MDAComicSummary objects.
 */
@property (nonatomic, strong) NSArray *collections;
/**
 *  The unique ID of the comic resource.
 */
@property (nonatomic, assign) NSInteger comicId;
/**
 *  A list of key dates for this comic. These are represented by MDAComicDate objects.
 */
@property (nonatomic, strong) NSArray *dates;
/**
 *  The Diamond code for the comic.
 */
@property (nonatomic, strong) NSString *diamondCode;
/**
 *  The ID of the digital comic representation of this comic. Will be 0 if the comic is not available digitally.
 */
@property (nonatomic, assign) NSInteger digitalId;
/**
 *  The EAN barcode for the comic.
 */
@property (nonatomic, strong) NSString *ean;
/**
 *  The actual EAN barcode.
 */
@property (nonatomic, assign) NSInteger ean13;
/**
 *  The optional 5 number barcode. 
 *
 *  @see http://www.comicbase.com/ComicBase_Confidential/2013-8/August_2013_Confidential.html
 */
@property (nonatomic, strong) NSString *eanSupplemental;
/**
 *  The publication format of the comic e.g. comic, hardcover, trade paperback.
 */
@property (nonatomic, strong) NSString *format;
/**
 *  A list of promotional images associated with this comic. These are represented by MDAImage objects.
 */
@property (nonatomic, strong) NSArray *images;
/**
 *  The ISBN for the comic (generally only populated for collection formats).
 */
@property (nonatomic, strong) NSString *isbn;
/**
 *  The ISSN barcode for the comic.
 */
@property (nonatomic, strong) NSString *issn;
/**
 *  The number of the issue in the series (will generally be 0 for collection formats).
 */
@property (nonatomic, assign) NSInteger issueNumber;
/**
 *  The number of story pages in the comic.
 */
@property (nonatomic, assign) NSInteger pageCount;
/**
 *  A list of prices for this comic. These are represented by MDAComicPrice objects.
 */
@property (nonatomic, strong) NSArray *prices;
/**
 *  A set of descriptive text blurbs for the comic. These are represented by MDATextObject objects.
 */
@property (nonatomic, strong) NSArray *textObjects;
/**
 *  The canonical title of the comic.
 */
@property (nonatomic, strong) NSString *title;
/**
 *  The UPC barcode number for the comic (generally only populated for periodical formats).
 */
@property (nonatomic, strong) NSString *upc;
/**
 *  A set of public web site URLs for the resource. These are represented by MDAUrl objects.
 */
@property (nonatomic, strong) NSArray *urls;
/**
 *  If the issue is a variant (e.g. an alternate cover, second printing, or director’s cut), a text description of the variant.
 */
@property (nonatomic, strong) NSString *variantDescription;

@end
