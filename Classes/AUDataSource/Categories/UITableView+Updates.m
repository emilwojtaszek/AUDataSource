//
//  UITableView+Updates.m
//  Pods
//
//  Created by Emil Wojtaszek on 17/04/14.
//
//

#import "UITableView+Updates.h"

@implementation UITableView (Updates)

- (void)au_performBatchUpdates:(AUCollectionUpdate *)update {
    [self beginUpdates];
    
    [self deleteSections:update.deletedSectionIndexes
                  withRowAnimation:UITableViewRowAnimationAutomatic];
    [self insertSections:update.insertedSectionIndexes
                  withRowAnimation:UITableViewRowAnimationAutomatic];
    [self reloadSections:update.updatedSectionIndexes
                  withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self deleteRowsAtIndexPaths:[update.deletedRowIndexPaths allObjects]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    [self insertRowsAtIndexPaths:[update.insertedRowIndexPaths allObjects]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    [self reloadRowsAtIndexPaths:[update.updatedRowIndexPaths allObjects]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self endUpdates];
}

@end
