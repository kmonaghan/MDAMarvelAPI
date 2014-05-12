//
//  MDASearchParameters.h
//  Marvel API
//
//  Created by Karl Monaghan on 09/02/2014.
//  Copyright (c) 2014 Crayons and Brown Paper. All rights reserved.
//

/**
 *  The MDASearchParameters object 
 *
 *  An instance of this object should be passed to the search methods in the NSURLSessionDataTask (MarvelDeveloperAPI)  category.
 *
 *  Since the search paramters are consistently named across the API, this object can be used for all the searches. At the moment, even invalid paramteres are passed to the API.
 *
 *  @TODO Perform validation of paramters
 */
@interface MDASearchParameters : NSObject
/**
 *  Return only comics which feature the specified characters (accepts a comma-separated list of ids).
 *  Used by:
 *
 *  - Comic
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSArray *characters;
/**
 *  Return only comics in which the specified creators worked together (for example in which BOTH Stan Lee and Jack Kirby did work). Accepts a comma-separated list of ids.
 *
 *  Used by:
 *
 *  - Comic
 *  - Creators
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSArray *collaborators;
/**
 *  Return only characters which appear in the specified comics (accepts a comma-separated list of ids).
 *
 *  Used by:
 *
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSArray *comics;
/**
 *  Return only items containing one or more comics with the specified format.
 *
 *  Options:
 *
 *  - comic
 *  - magazine
 *  - trade paperback
 *  - hardcover
 *  - digest
 *  - graphic novel
 *  - digital comic
 *  - infinite comic
 *
 *  Used by:
 *
 *  - Comic
 *  - Characters
 *  - Creators
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSString *contains;
/**
 *  Return only events which feature work by the specified creators (accepts a comma-separated list of ids).
 *
 *  Used by:
 *
 *  - Comic
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSArray *creators;
/**
 *  Return items within a predefined date range.
 *
 *
 *  Options:
 *
 *  - lastWeek
 *  - thisWeek
 *  - nextWeek
 *  - thisMonth
 *
 *  Used by:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSString *dateDescriptor;
/**
 *  Return comics within a predefined date range. Dates must be specified as date1,date2 (e.g. 2013-01-01,2013-01-02). Dates are preferably formatted as YYYY-MM-DD but may be sent as any common date format.
 *
 *  Options:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSArray *dateRange;
/**
 *  Filter by diamond code.
 *
 *  Options:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSString *diamondCode;
/**
 *  Filter by digital comic id.
 *
 *  Options:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSString *digitalId;
/**
 *  Filter by EAN.
 *
 *  Options:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSString *ean;
/**
 *  Return only items which appear in the specified events (accepts a comma-separated list of ids).
 *
 * Used by:
 *
 *  - Comic
 *  - Characters
 *  - Creators
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSArray *events;
/**
 *  Filter by creator first name (e.g. brian).
 *
 * Used by:
 *
 *  - Comic
 *  - Characters
 *  - Creators
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSString *firstName;
/**
 *  Filter by creator first names that match critera (e.g. B, St L).
 *
 * Used by:
 *
 *  - Creator
 */
@property (strong, nonatomic) NSString *firstNameStartsWith;
/**
 *  Return only items containing one or more comics with the specified format.
 *
 *  Options:
 *
 *  - comic
 *  - magazine
 *  - trade paperback
 *  - hardcover
 *  - digest
 *  - graphic novel
 *  - digital comic
 *  - infinite comic
 *
 *  Used by:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSString *format;
/**
 *  Filter by the issue format type (comic or collection).
 *
 *  Options:
 *
 *  - comic
 *  - collection
 *
 *  Used by:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSString *formatType;
/**
 *  Include only results which are available digitally.
 *
 *  Used by:
 *
 *  - Comic
 */
@property (assign, nonatomic) BOOL hasDigitalIssue;
/**
 *  Filter by ISBN.
 *
 *  Used by:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSString *isbn;
/**
 *  Filter by ISSN.
 *
 *  Used by:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSString *issn;
/**
 *  Return only issues in series whose issue number matches the input.
 *
 *  Used by:
 *
 *  - Comic
 */
@property (nonatomic) NSInteger issueNumber;
/**
 *  Filter by creator last name (e.g. Bendis).
 *
 *  Used by:
 *
 *  - Creator
 */
@property (strong, nonatomic) NSString *lastName;
/**
 *  Filter by creator last names that match critera (e.g. Ben).
 *
 *  Used by:
 *
 *  - Creator
 */
@property (strong, nonatomic) NSString *lastNameStartsWith;
/**
 *  Limit the result set to the specified number of resources.
 *
 *  Used by:
 *
 *  - Characters
 *  - Comic
 *  - Events
 *  - Series
 *  - Stories
 */
@property (assign, nonatomic) NSInteger limit;
/**
 *  Filter by creator middle name (e.g. Michael).
 *
 *  Used by:
 *
 *  - Comic
 *  - Characters
 *  - Creators
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSString *middleName;
/**
 *  Filter by creator middle names that match critera (e.g. Mi).
 *
 *  Used by:
 *
 *  - Creator
 */
@property (strong, nonatomic) NSString *middleNameStartsWith;
/**
 *  Return only items which have been modified since the specified date.
 *
 *  Used by:
 *
 *  - Comic
 *  - Characters
 *  - Creators
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSDate *modifiedSince;
/**
 *  Return only characters matching the specified full character name (e.g. Spider-Man).
 *
 *  Used by:
 *  - Comic
 *  - Characters
 *  - Creators
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSString *name;
/**
 *  Return items with names that begin with the specified string (e.g. Sp).
 *
 *  Used by:
 *  - Characters
 *  - Events
 */
@property (strong, nonatomic) NSString *nameStartsWith;
/**
 *  Exclude variants (alternate covers, secondary printings, director's cuts, etc.) from the result set.
 *
 *  Used by:
 *  - Comics
 */
@property (assign, nonatomic) BOOL noVariants;
/**
 *  Skip the specified number of resources in the result set.
 *
 *  Used by:
 *
 *  - Comic
 *  - Characters
 *  - Creators
 *  - Events
 *  - Series
 *  - Stories
 */
@property (assign, nonatomic) NSInteger offset;
/**
 *  Order the result set by a field or fields. Add a "-" to the value sort in descending order. Multiple values are given priority in the order in which they are passed.
 *
 *  Options are:
 *
 *  - id (stories)
 *  - focDate (comic)
 *  - issueNumber (comic)
 *  - title (comic, series)
 *  - name (character, events)
 *  - modified (character, comic, events, series, stories)
 *  - onsaleDate (comic)
 *  - startDate (events)
 *  - startYear (series)
 */
@property (strong, nonatomic) NSString *orderBy;
/**
 *  Return only items which appear the specified series (accepts a comma-separated list of ids).
 *
 *  Used by:
 *
 *  - Comic
 *  - Characters
 *  - Creators
 *  - Events
 *  - Stories
 */
@property (strong, nonatomic) NSArray *series;
/**
 *  Filter by publication frequency type.
 *
 *  Options:
 *
 *  - collection
 *  - one shot
 *  - limited
 *  - ongoing
 *
 *  Used by:
 *
 *  - Comic
 *  - Characters
 *  - Creators
 *  - Events
 *  - Series
 *  - Stories
 */
@property (strong, nonatomic) NSString *seriesType;
/**
 *  Return only comics in which the specified characters appear together (for example in which BOTH Spider-Man and Wolverine appear). Accepts a comma-separated list of ids.
 *
 *  Used by:
 *
 *  - Comic
 */
@property (strong, nonatomic) NSArray *sharedAppearances;
/**
 *  Return only series or comics matching the specified start year.
 *
 *  Used by:
 *
 *  - Comic
 *  - Events
 */
@property (assign, nonatomic) NSInteger startYear;
/**
 *  Return only characters which appear the specified stories (accepts a comma-separated list of ids).
 *
 *  Used by:
 *
 *  - Characters
 *  - Events
 *  - Series
 */
@property (strong, nonatomic) NSArray *stories;
/**
 *  Filter by title.
 *
 *  Used by:
 *  - Comic
 *  - Series
 */
@property (strong, nonatomic) NSString *title;
/**
 *  Return items with titles that begin with the specified string (e.g. Sp).
 *
 *  Used by:
 *  - Comic
 *  - Series
 */
@property (strong, nonatomic) NSString *titleStartsWith;
@property (strong, nonatomic) NSString *upc;

/**
 *  Return the parameters set in the object. 
 *
 *  @return The set paramters as a dicitonary suitable for use with a AFNetwork request
 */
- (NSDictionary *)parameters;

@end
