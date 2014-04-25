//
//  AUCollectionViewDataSource.m
//  Test
//
//  Created by Emil Wojtaszek on 15/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUCollectionViewDataSource.h"

@implementation AUCollectionViewDataSource

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.dataProvider numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataProvider numberOfObjectsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = nil;
    
    // get item from colelction
    id item = [self.dataProvider objectAtIndexPath:indexPath];
    
    // prepare cell indetifier
    if (self.cellIdentifierHandler) {
        cellIdentifier = self.cellIdentifierHandler(item, indexPath);
    }
    
    // dequeue cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                           forIndexPath:indexPath];;
    
    // configure cell
    [self configureCell:cell withItem:item atIndexPath:indexPath];
    return cell;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//
//    static NSString *cellIdentifier = nil;
//
//    // get item from colelction
//    id item = [self.dataStorage supplementaryItemOfKind:kind section:indexPath.section];
//
//    // prepare cell indetifier
//    if (self.supplementaryViewIdentifierHandler) {
//        cellIdentifier = self.supplementaryViewIdentifierHandler(kind, indexPath);
//    }
//
//    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind
//                                                                        withReuseIdentifier:cellIdentifier
//                                                                               forIndexPath:indexPath];
//
//    // configure supplementary view
//    [self configureSupplementaryView:view ofKind:kind item:item atIndexPath:indexPath];
//    return view;
//}

#pragma mark -
#pragma mark Supplementary view customizeation

- (void)configureSupplementaryView:(UIView *)view ofKind:(NSString *)kind item:(id)item atIndexPath:(NSIndexPath *)indexPath {
    if (self.supplementaryViewConfigurationHandler) {
        self.supplementaryViewConfigurationHandler(view, kind, item, indexPath);
    }
}

@end
