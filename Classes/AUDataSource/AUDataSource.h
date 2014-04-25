//
//  AUDataSource.h
//  Test
//
//  Created by Emil Wojtaszek on 15/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

//Frameworks
#import <Foundation/Foundation.h>

//Others
#import "AUDataProvider.h"

//Cells
typedef NSString *(^AUDataSourceCellIdentifierHandler)(id item, NSIndexPath *indexPath);
typedef void(^AUDataSourceCellConfigureHandler)(id cell, id item, NSIndexPath *indexPath);

@interface AUDataSource : NSObject

/**
 *  Data source data provider
 */
@property (nonatomic, strong) id<AUDataProviderProtocol> dataProvider;

/**
 *  Return cell id for the given item/indexpath
 **/
@property (nonatomic, copy) AUDataSourceCellIdentifierHandler cellIdentifierHandler;
/**
 *  Passes cell, raw item from tableData (or filteredData), and the indexPath for that item
 **/
@property (nonatomic, copy) AUDataSourceCellConfigureHandler cellConfigurationHandler;

/**
 *  This gets called for every row.  If the `cellConfigurationHandler` is set
 *  Then it will use that for customization.  Otherwise it will set the cell.textLabel.text
 *  to whatever string is given
 **/
- (void)configureCell:(id)cell withItem:(id)item atIndexPath:(NSIndexPath *)indexPath;

@end
