//
//  AUCoreDataProvider.m
//  Beacons
//
//  Created by Emil Wojtaszek on 19/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUCoreDataProvider.h"
#import "AUCollectionUpdate.h"

@implementation AUCoreDataProvider {
    AUCollectionUpdate *_collectionUpdate;
}

#pragma mark -
#pragma mark AUDataProviderProtocol

- (NSInteger)numberOfSections {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)numberOfObjectsInSection:(NSInteger)section {
    return [[[_fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

- (NSArray *)itemsInSection:(NSUInteger)sectionNumber {
    return [[[_fetchedResultsController sections] objectAtIndex:sectionNumber] objects];
}

- (NSIndexPath *)indexPathOfObject:(id)object {
    return [_fetchedResultsController indexPathForObject:object];
}

#pragma mark -
#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self _beginUpdate];
}

/*
 Thanks to Michael Fey for NSFetchedResultsController updates done right!
 http://www.fruitstandsoftware.com/blog/2013/02/uitableview-and-nsfetchedresultscontroller-updates-done-right/
 */

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    if (type == NSFetchedResultsChangeInsert) {
        if ([_collectionUpdate.insertedSectionIndexes containsIndex:newIndexPath.section]) {
            // If we've already been told that we're adding a section for this inserted row we skip it since it will handled by the section insertion.
            return;
        }
        
        [_collectionUpdate.insertedRowIndexPaths addObject:newIndexPath];
    }
    
    else if (type == NSFetchedResultsChangeDelete) {
        if ([_collectionUpdate.deletedSectionIndexes containsIndex:indexPath.section]) {
            // If we've already been told that we're deleting a section for this deleted row we skip it since it will handled by the section deletion.
            return;
        }
        
        [_collectionUpdate.deletedRowIndexPaths addObject:indexPath];
    }
    
    else if (type == NSFetchedResultsChangeMove) {
        if ([_collectionUpdate.insertedSectionIndexes containsIndex:newIndexPath.section] == NO) {
            [_collectionUpdate.insertedRowIndexPaths addObject:newIndexPath];
        }
        
        if ([_collectionUpdate.deletedSectionIndexes containsIndex:indexPath.section] == NO) {
            [_collectionUpdate.deletedRowIndexPaths addObject:indexPath];
        }
        
    }
    
    else if (type == NSFetchedResultsChangeUpdate) {
        [_collectionUpdate.updatedRowIndexPaths addObject:indexPath];
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id)sectionInfo atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [_collectionUpdate.insertedSectionIndexes addIndex:sectionIndex];
            break;
        case NSFetchedResultsChangeDelete:
            [_collectionUpdate.deletedSectionIndexes addIndex:sectionIndex];
            break;
        default:; // Shouldn't have a default
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self _endUpdate];
}

#pragma mark - 
#pragma mark Private

- (void)_beginUpdate {
    _collectionUpdate = [AUCollectionUpdate new];
}

- (void)_endUpdate {
    if ([self.delegate respondsToSelector:@selector(coreDataProvider:didPerformUpdate:)]) {
        [self.delegate coreDataProvider:self didPerformUpdate:_collectionUpdate];
    }
    
    _collectionUpdate = nil;
}

@end
