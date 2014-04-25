//
//  AUMemoryDataProvider.m
//  Beacons
//
//  Created by Emil Wojtaszek on 19/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUMemoryDataProvider.h"

//COllectionStorage
#import "AUCollectionSection.h"

@implementation AUMemoryDataProvider

- (instancetype)init {
    self = [super init];
    if (self) {
        _collectionStorage = [AUCollectionStorage new];
    }
    return self;
}

#pragma mark -
#pragma mark AUDataProviderProtocol

- (NSInteger)numberOfSections {
    return [[self.collectionStorage sections] count];
}

- (NSInteger)numberOfObjectsInSection:(NSInteger)section {
    return [[[self.collectionStorage sections] objectAtIndex:section] numberOfObjects];
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    id<AUCollectionSectionProtocol> section = [[self.collectionStorage sections] objectAtIndex:indexPath.section];
    return [[section objects] objectAtIndex:indexPath.row];
}

- (NSArray *)itemsInSection:(NSUInteger)sectionNumber {
    return [[[self.collectionStorage sections] objectAtIndex:sectionNumber] objects];
}

- (NSIndexPath *)indexPathOfObject:(id)object {
    __block NSIndexPath *indexPath = nil;
    
    // get sections
    NSArray *sections = [self.collectionStorage sections];

    [sections enumerateObjectsUsingBlock:^(id<AUCollectionSectionProtocol> section, NSUInteger idx, BOOL *stop) {
        NSUInteger index = [[section objects] indexOfObject:object];

        if (index != NSNotFound) {
            indexPath = [NSIndexPath indexPathForRow:index inSection:idx]; *stop = YES;
        }
    }];
    
    return indexPath;
}

@end
