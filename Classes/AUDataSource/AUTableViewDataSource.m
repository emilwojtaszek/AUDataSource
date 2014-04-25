//
//  AUTableViewDataSource.m
//  Test
//
//  Created by Emil Wojtaszek on 15/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUTableViewDataSource.h"

@implementation AUTableViewDataSource

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataProvider numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataProvider numberOfObjectsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = nil;
    
    // get item from colelction
    id item = [self.dataProvider objectAtIndexPath:indexPath];
    
    // prepare cell indetifier
    if (self.cellIdentifierHandler) {
        cellIdentifier = self.cellIdentifierHandler(item, indexPath);
    }

    // dequeue cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    // configure cell
    [self configureCell:cell withItem:item atIndexPath:indexPath];
    return cell;
}

@end
