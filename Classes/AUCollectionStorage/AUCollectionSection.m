//
//  AUSection.m
//  Beacons
//
//  Created by Emil Wojtaszek on 19/04/14.
//  Copyright (c) 2014 AppUnite.com. All rights reserved.
//

#import "AUCollectionSection.h"

@implementation AUCollectionSection

- (instancetype)init {
    self = [super init];
    if (self) {
        _objects = [NSMutableArray new];
    }
    return self;
}

#pragma mark -
#pragma mark AUSectionInfo

- (NSString *)name {
    return nil;
}

- (NSString *)indexTitle {
    return nil;
}

- (NSUInteger)numberOfObjects {
    return [_objects count];
}

@end
