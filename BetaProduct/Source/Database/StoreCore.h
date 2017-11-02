//
//  StoreCore.h
//  BetaProduct
//
//  Created by User on 10/17/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoreProtocol.h"
#import "DatabaseTypes.h"

@interface StoreCore : NSObject <StoreProtocol>

- (void) save;
- (void) saveWithCompletionBlock : (CompletionBlock) completionBlock;
- (void) saveOrRollback;
- (void) saveOrRollback : (CompletionBlock) completionBlock;

@end
