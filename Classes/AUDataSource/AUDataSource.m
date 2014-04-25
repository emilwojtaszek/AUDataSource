//
//  AUDataSource.m
//  Test
//
//  Created by Emil Wojtaszek on 15/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUDataSource.h"

@implementation AUDataSource

#pragma mark -
#pragma mark Cell customizeation

- (void)configureCell:(id)cell withItem:(id)item atIndexPath:(NSIndexPath *)indexPath {
    if (self.cellConfigurationHandler) {
        self.cellConfigurationHandler(cell, item, indexPath);
    }
}

@end
