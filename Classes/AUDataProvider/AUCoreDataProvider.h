//
//  AUCoreDataProvider.h
//  Beacons
//
//  Created by Emil Wojtaszek on 19/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

//Frameworks
#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"

//DataProvider
#import "AUDataProvider.h"

@protocol AUCoreDataProviderDelegate;
@interface AUCoreDataProvider : NSObject <NSFetchedResultsControllerDelegate>

@property (nonatomic, weak) id<AUCoreDataProviderDelegate> delegate;

/**
 */
@property (nonatomic, strong, readonly) NSFetchedResultsController *fetchedResultsController;

@end

@protocol AUCoreDataProviderDelegate <NSObject>
- (void)coreDataProvider:(AUCoreDataProvider *)provider didPerformUpdate:(AUCollectionUpdate *)update;
@end
