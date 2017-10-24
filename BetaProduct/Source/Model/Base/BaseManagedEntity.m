//
//  BaseManagedEntity.m
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "BaseManagedEntity.h"

@implementation BaseManagedEntity

- (id) init {
    self = [super init];
    if (self) {
        self.status = StatusActive;
        self.syncStatus = SyncStatusCreated;
        self.col1 = @"";
        self.col2 = @"";
        self.col3 = @"";
        self.createdAt = [NSDate date];
        self.modifiedAt = [NSDate date];
    }
    return self;
}

@end
