//
//  DatabaseTypes.h
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseTypes : NSObject

typedef NS_ENUM(int16_t, SyncStatus) {
    SyncStatusSynced = 1,
    SyncStatusCreated,
    SyncStatusUpdated,
    SyncStatusDeleted
};

typedef NS_ENUM(int16_t, Status) {
    StatusActive = 1,
    StatusInactive,
    StatusDeleted
};

@end
