//
//  SyncEngine.h
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompletionBlockTypes.h"

@class NSManagedObject;

@interface SyncEngine : NSObject

+ (SyncEngine *) sharedManager;

- (void) startInitialSync : (CompletionBlock) block;
//- (void) registerEntityForBatchSync : (Class) entityClass;

@end
