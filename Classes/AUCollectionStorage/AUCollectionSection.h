//
//  AUSection.h
//  Beacons
//
//  Created by Emil Wojtaszek on 19/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

// Frameworks
#import <Foundation/Foundation.h>

@protocol AUCollectionSectionProtocol <NSObject>

// Name of the section
@property (nonatomic, readonly) NSString *name;

// Title of the section (used when displaying the index)
@property (nonatomic, readonly) NSString *indexTitle;

// Number of objects in section
@property (nonatomic, readonly) NSUInteger numberOfObjects;

// Returns the array of objects in the section.
@property (nonatomic, readonly) NSArray *objects;
@end

@interface AUCollectionSection : NSObject <AUCollectionSectionProtocol>

/**
 *  Items for current section
 */
@property (nonatomic, strong) NSMutableArray *objects;
@end
