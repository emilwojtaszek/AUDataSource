//
//  AUStorageUpdate.h
//  Beacons
//
//  Created by Emil Wojtaszek on 19/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AUCollectionUpdate : NSObject

/**
 * Indexes of deleted sections for current update.
 */
@property (nonatomic, strong) NSMutableIndexSet *deletedSectionIndexes;

/**
 * Indexes of inserted sections for current update.
 */
@property (nonatomic, strong) NSMutableIndexSet *insertedSectionIndexes;

/**
 * Indexes of updated sections for current update.
 */
@property (nonatomic, strong) NSMutableIndexSet *updatedSectionIndexes;

/**
 * Index paths of deleted rows for current update.
 */
@property (nonatomic, strong) NSMutableSet *deletedRowIndexPaths;

/**
 * Index paths of inserted rows for current update.
 */
@property (nonatomic, strong) NSMutableSet *insertedRowIndexPaths;

/**
 * Index paths of updated rows for current update.
 */
@property (nonatomic, strong) NSMutableSet *updatedRowIndexPaths;

@end
