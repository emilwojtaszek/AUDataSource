//
//  UITableView+Updates.h
//  Pods
//
//  Created by Emil Wojtaszek on 17/04/14.
//
//

//Framworks
#import <UIKit/UIKit.h>

//DataStorage
#import "AUCollectionUpdate.h"

@interface UITableView (Updates)
- (void)au_performBatchUpdates:(AUCollectionUpdate *)updates;
@end
