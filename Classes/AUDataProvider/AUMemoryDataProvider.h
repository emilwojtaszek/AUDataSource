//
//  AUMemoryDataProvider.h
//  Beacons
//
//  Created by Emil Wojtaszek on 19/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

//Frameworks
#import <Foundation/Foundation.h>

//DataProvider
#import "AUDataProvider.h"

//DataStorage
#import "AUCollectionStorage.h"

@interface AUMemoryDataProvider : NSObject <AUDataProviderProtocol>

@property (nonatomic, strong, readonly) AUCollectionStorage *collectionStorage;
@end
