//
//  AUDataProvider.h
//  Beacons
//
//  Created by Emil Wojtaszek on 19/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

//Frameworks
#import <Foundation/Foundation.h>

//AUCollectionStorage
#import "AUCollectionUpdate.h"

@protocol AUDataProviderProtocol <NSObject>

/* Calculate number of section */
- (NSInteger)numberOfSections;

/* Calculate number of rows in given section index of collection */
- (NSInteger)numberOfObjectsInSection:(NSInteger)section;

/* Return object at given index path from collection */
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

/* Return objects at given section index from collection */
- (NSArray *)itemsInSection:(NSUInteger)sectionNumber;

/* Return index path of object from collection */
- (NSIndexPath *)indexPathOfObject:(id)object;
@end
