//
//  StoreCore.h
//  BetaProduct
//
//  Created by User on 10/17/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoreProtocol.h"

@interface StoreCore : NSObject <StoreProtocol>

- (void) save;
- (void) saveWithCompletionBlock : (StoreCompletionBlock) completionBlock;

@end
