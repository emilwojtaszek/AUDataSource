//
//  UICollectionView+Updates.m
//  Pods
//
//  Created by Emil Wojtaszek on 17/04/14.
//
//

#import "UICollectionView+Updates.h"

@implementation UICollectionView (Updates)

- (void)au_performBatchUpdates:(AUCollectionUpdate *)update {
    NSMutableIndexSet *sectionsToInsert = [NSMutableIndexSet indexSet];
    [update.insertedSectionIndexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        if ([self numberOfSections] <= idx) {
            [sectionsToInsert addIndex:idx];
        }
    }];
    
    NSInteger sectionChanges = [update.deletedSectionIndexes count] + [update.insertedSectionIndexes count] + [update.updatedSectionIndexes count];
    NSInteger itemChanges = [update.deletedRowIndexPaths count] + [update.insertedRowIndexPaths count] + [update.updatedRowIndexPaths count];
    
    if (sectionChanges > 0) {
        [self performBatchUpdates:^{
            [self deleteSections:update.deletedSectionIndexes];
            [self insertSections:sectionsToInsert];
            [self reloadSections:update.updatedSectionIndexes];
        } completion:nil];
    }
    
    if ([self shouldReloadCollectionViewToPreventInsertFirstItemIssueForUpdate:update]) {
        [self reloadData];
        return;
    }
    
    if (itemChanges > 0 && sectionChanges == 0) {
        [self performBatchUpdates:^{
            [self deleteItemsAtIndexPaths:update.deletedRowIndexPaths];
            [self insertItemsAtIndexPaths:update.insertedRowIndexPaths];
            [self reloadItemsAtIndexPaths:update.updatedRowIndexPaths];
        } completion:nil];
    }
}

// This is to prevent a bug in UICollectionView from occurring.
// The bug presents itself when inserting the first object or deleting the last object in a collection view.
// http://stackoverflow.com/questions/12611292/uicollectionview-assertion-failure
// http://stackoverflow.com/questions/13904049/assertion-failure-in-uicollectionviewdata-indexpathforitematglobalindex
// This code should be removed once the bug has been fixed, it is tracked in OpenRadar
// http://openradar.appspot.com/12954582
- (BOOL)shouldReloadCollectionViewToPreventInsertFirstItemIssueForUpdate:(AUCollectionUpdate *)update {
    BOOL shouldReload = NO;
    
    for (NSIndexPath * indexPath in update.insertedRowIndexPaths) {
        if ([self numberOfItemsInSection:indexPath.section] == 0) {
            shouldReload = YES;
        }
    }
    
    for (NSIndexPath * indexPath in update.deletedRowIndexPaths) {
        if ([self numberOfItemsInSection:indexPath.section] == 1) {
            shouldReload = YES;
        }
    }
    
    if (self.window == nil) {
        shouldReload = YES;
    }
    
    return shouldReload;
}
@end
