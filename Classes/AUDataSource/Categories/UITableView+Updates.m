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
        withRowAnimation:UITableViewRowAnimationFade];
    [self insertSections:update.insertedSectionIndexes
        withRowAnimation:UITableViewRowAnimationFade];
    [self reloadSections:update.updatedSectionIndexes
        withRowAnimation:UITableViewRowAnimationFade];
    
    [self deleteRowsAtIndexPaths:update.deletedRowIndexPaths
                withRowAnimation:UITableViewRowAnimationFade];
    [self insertRowsAtIndexPaths:update.insertedRowIndexPaths
                withRowAnimation:UITableViewRowAnimationFade];
    [self reloadRowsAtIndexPaths:update.updatedRowIndexPaths
                withRowAnimation:UITableViewRowAnimationFade];
    
    [self endUpdates];
}

@end
