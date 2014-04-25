//
//  UICollectionView+Updates.h
//  Pods
//
//  Created by Emil Wojtaszek on 17/04/14.
//
//

#import <UIKit/UIKit.h>

//DataStorage
#import "AUCollectionUpdate.h"

@interface UICollectionView (Updates)
- (void)au_performBatchUpdates:(AUCollectionUpdate *)updates;
@end
