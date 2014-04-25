//
//  AUCollectionViewDataSource.h
//  Test
//
//  Created by Emil Wojtaszek on 15/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

//Frameworks
#import <Foundation/Foundation.h>

//Others
#import "AUDataSource.h"

//Supplementary view
typedef NSString *(^AUDataSourceSupplementaryViewIdentifierHandler)(NSString *kind, NSIndexPath *indexPath);
typedef void(^AUDataSourceSupplementaryViewConfigureHandler)(id view, NSString *kind, id item, NSIndexPath *indexPath);

@interface AUCollectionViewDataSource : AUDataSource <UICollectionViewDataSource>
/**
 *  Return supplementary view id for the given item/indexpath
 **/
@property (nonatomic, copy) AUDataSourceSupplementaryViewIdentifierHandler supplementaryViewIdentifierHandler;
/**
 *  Passes supplementary view, raw item from tableData (or filteredData), and the indexPath for that item
 **/
@property (nonatomic, copy) AUDataSourceSupplementaryViewConfigureHandler supplementaryViewConfigurationHandler;

/**
 *  This gets called for every row.  If the `cellConfigurationHandler` is set
 *  Then it will use that for customization.  Otherwise it will set the cell.textLabel.text
 *  to whatever string is given
 **/
- (void)configureSupplementaryView:(UIView *)view ofKind:(NSString *)kind item:(id)item atIndexPath:(NSIndexPath *)indexPath;

@end
