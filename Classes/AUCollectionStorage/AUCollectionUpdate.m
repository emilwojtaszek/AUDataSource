//
//  AUStorageUpdate.m
//  Beacons
//
//  Created by Emil Wojtaszek on 19/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUCollectionUpdate.h"

@implementation AUCollectionUpdate

- (NSMutableIndexSet *)deletedSectionIndexes {
    if (!_deletedSectionIndexes) {
        _deletedSectionIndexes = [NSMutableIndexSet new];
    }
    
    return _deletedSectionIndexes;
}

- (NSMutableIndexSet *)insertedSectionIndexes {
    if (!_insertedSectionIndexes) {
        _insertedSectionIndexes = [NSMutableIndexSet new];
    }
    
    return _insertedSectionIndexes;
}

- (NSMutableIndexSet *)updatedSectionIndexes {
    if (!_updatedSectionIndexes) {
        _updatedSectionIndexes = [NSMutableIndexSet new];
    }
    
    return _updatedSectionIndexes;
}

- (NSMutableArray *)deletedRowIndexPaths {
    if (!_deletedRowIndexPaths) {
        _deletedRowIndexPaths = [NSMutableArray new];
    }
    
    return _deletedRowIndexPaths;
}

- (NSMutableArray *)insertedRowIndexPaths {
    if (!_insertedRowIndexPaths) {
        _insertedRowIndexPaths = [NSMutableArray new];
    }
    
    return _insertedRowIndexPaths;
}

- (NSMutableArray *)updatedRowIndexPaths {
    if (!_updatedRowIndexPaths) {
        _updatedRowIndexPaths = [NSMutableArray new];
    }
    
    return _updatedRowIndexPaths;
}

@end
