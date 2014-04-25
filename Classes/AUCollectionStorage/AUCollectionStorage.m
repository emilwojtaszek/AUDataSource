//
//  AUMemoryStorage.m
//  Beacons
//
//  Created by Emil Wojtaszek on 18/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUCollectionStorage.h"
#import "AUCollectionSection.h"

@interface AUCollectionStorage ()
@property (nonatomic, strong) NSMutableArray *sections;
@property (nonatomic, strong) AUCollectionUpdate *storageUpdate;
@end

@implementation AUCollectionStorage

- (instancetype)init {
    self = [super init];
    if (self) {
        _sections = [NSMutableArray new];
    }
    return self;
}

#pragma mark -
#pragma mark Instance methods

- (void)addItem:(id)item toSection:(NSUInteger)sectionIdx {
    [self addItems:@[item] toSection:0];
}

- (void)addItems:(NSArray *)items toSection:(NSUInteger)sectionIdx {
    // get valid section
    AUCollectionSection *section = nil;
    
    // get section object model
    if ([_sections count] > sectionIdx) {
        section = [_sections objectAtIndex:sectionIdx];
    }
    
    if (!section) {
        // create and collect new section
        section = [AUCollectionSection new];
        [_sections addObject:section];
        
        // note changes
        [_storageUpdate.insertedSectionIndexes addIndex:sectionIdx];
    }
    
    // get object count
    NSInteger count = [section numberOfObjects];
    // add new object to section
    [section.objects addObjectsFromArray:items];
    
    // note changes
    for (NSInteger i = count; i < [section numberOfObjects]; i++) {
        [_storageUpdate.insertedRowIndexPaths addObject:[NSIndexPath indexPathForRow:i inSection:sectionIdx]];
    }
}

- (void)insertItem:(id)item toIndexPath:(NSIndexPath *)indexPath {
    // get section
    AUCollectionSection *section = [_sections objectAtIndex:indexPath.section];
    
    if (section) {
        // add new object
        [section.objects insertObject:item atIndex:indexPath.row];
        // note changes
        [_storageUpdate.insertedRowIndexPaths addObject:indexPath];
    }
}

- (void)removeItem:(id)item {
    [self removeItems:@[item]];
}

- (void)removeItems:(NSArray *)items {
    for (id item in items) {
        NSIndexPath *indexPath = [self _indexPathOfObject:item];
        
        if (indexPath) {
            // get section
            AUCollectionSection *section = [_sections objectAtIndex:indexPath.section];
            // remove object
            [section.objects removeObjectAtIndex:indexPath.row];
            // note changes
            [_storageUpdate.deletedRowIndexPaths addObject:indexPath];
        }
    }
}

- (void)removeItemsAtIndexPaths:(NSArray *)indexPaths {
    for (NSIndexPath *indexPath in indexPaths) {
        // get section
        AUCollectionSection *section = [_sections objectAtIndex:indexPath.section];
        // remove object
        [section.objects removeObjectAtIndex:indexPath.row];
        // note changes
        [_storageUpdate.deletedRowIndexPaths addObject:indexPath];
    }
}

- (void)replaceItem:(id)itemToReplace withItem:(id)replacingItem {
    // get index path
    NSIndexPath *indexPath = [self _indexPathOfObject:itemToReplace];
    if (indexPath) {
        // get section
        AUCollectionSection *section = [_sections objectAtIndex:indexPath.section];
        // replace object
        [section.objects replaceObjectAtIndex:indexPath.row withObject:replacingItem];
        // note changes
        [_storageUpdate.updatedRowIndexPaths addObject:indexPath];
    }
}

- (void)replaceItemAtIndexPath:(NSIndexPath *)indexPath withItem:(id)replacingItem {
    // get section
    AUCollectionSection *section = _sections[indexPath.section];
    // replace object
    [section.objects replaceObjectAtIndex:indexPath.row withObject:replacingItem];
    
    // note changes
    [_storageUpdate.updatedRowIndexPaths addObject:indexPath];
}

- (void)deleteSections:(NSIndexSet *)indexSet {
    // delete sections with set
    [_sections removeObjectsAtIndexes:indexSet];
    
    // note changes
    [_storageUpdate.deletedSectionIndexes addIndexes:indexSet];
}

- (AUCollectionUpdate *)recordBatchUpdates:(void (^)(void))action {
    // crete colelction update
    _storageUpdate = [AUCollectionUpdate new];
    // perform update action
    action();
    
    // clean up
    NSArray *update = _storageUpdate;
    _storageUpdate = nil;
    
    return update;
}

- (void)beginUpdates {
    NSAssert(!_storageUpdate, @"Already in update process");
}

- (void)endUpdates:(AUCollectionUpdate **)update {
    *update = _storageUpdate;
    
}

#pragma mark - 
#pragma mark Private

- (NSIndexPath *)_indexPathOfObject:(id)object {
    for (NSUInteger sectionIdx = 0; sectionIdx < _sections.count; sectionIdx++) {
        NSArray *objects = [_sections[sectionIdx] objects];
        NSUInteger index = [objects indexOfObject:object];
        
        if (index != NSNotFound) {
            return [NSIndexPath indexPathForRow:index inSection:sectionIdx];
        }
    }
    return nil;
}

@end
