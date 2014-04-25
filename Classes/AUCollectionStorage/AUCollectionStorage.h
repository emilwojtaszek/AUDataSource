//
//  AUMemoryStorage.h
//  Beacons
//
//  Created by Emil Wojtaszek on 18/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

//Framework
#import <Foundation/Foundation.h>

//
#import "AUCollectionUpdate.h"

@interface AUCollectionStorage : NSObject

// sections array
- (NSArray *)sections;

// Add item to section with `sectionNumber`.
- (void)addItem:(id)item toSection:(NSUInteger)sectionIdx;

// Add items to section with `sectionNumber`.
- (void)addItems:(NSArray *)items toSection:(NSUInteger)sectionIdx;

// Insert item to indexPath `indexPath`.
- (void)insertItem:(id)item toIndexPath:(NSIndexPath *)indexPath;

// Replace itemToReplace with replacingItem. If itemToReplace is not found, or replacingItem is nil, this method does nothing.
- (void)replaceItem:(id)itemToReplace withItem:(id)replacingItem;

// Replace itemToReplace with replacingItem. If itemToReplace is not found, or replacingItem is nil, this method does nothing.
- (void)replaceItemAtIndexPath:(NSIndexPath *)indexPath withItem:(id)replacingItem;

// Removing item. If item is not found, this method does nothing.
- (void)removeItem:(id)item;

// Removing item at desired indexPath. If number of objects in section is less that indexPath's item, this method does nothing.
- (void)removeItemsAtIndexPaths:(NSArray *)indexPaths;

// Removing items. If some item is not found, it is skipped.
- (void)removeItems:(NSArray *)items;

// Deletes one or more sections.
- (void)deleteSections:(NSIndexSet *)indexSet;

// transaction
- (AUCollectionUpdate *)recordBatchUpdates:(void (^)(void))action;
@end
