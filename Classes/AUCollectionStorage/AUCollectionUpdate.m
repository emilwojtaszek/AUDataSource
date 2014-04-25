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
        _deletedSectionIndexes = [NSMutableIndexSet indexSet];
    }
    
    return _deletedSectionIndexes;
}

- (NSMutableIndexSet *)insertedSectionIndexes {
    if (!_insertedSectionIndexes) {
        _insertedSectionIndexes = [NSMutableIndexSet indexSet];
    }
    
    return _insertedSectionIndexes;
}

- (NSMutableIndexSet *)updatedSectionIndexes {
    if (!_updatedSectionIndexes) {
        _updatedSectionIndexes = [NSMutableIndexSet indexSet];
    }
    
    return _updatedSectionIndexes;
}

- (NSMutableSet *)deletedRowIndexPaths {
    if (!_deletedRowIndexPaths) {
        _deletedRowIndexPaths = [NSMutableSet set];
    }
    
    return _deletedRowIndexPaths;
}

- (NSMutableSet *)insertedRowIndexPaths {
    if (!_insertedRowIndexPaths) {
        _insertedRowIndexPaths = [NSMutableSet set];
    }
    
    return _insertedRowIndexPaths;
}

- (NSMutableSet *)updatedRowIndexPaths {
    if (!_updatedRowIndexPaths) {
        _updatedRowIndexPaths = [NSMutableSet set];
    }
    
    return _updatedRowIndexPaths;
}

@end
