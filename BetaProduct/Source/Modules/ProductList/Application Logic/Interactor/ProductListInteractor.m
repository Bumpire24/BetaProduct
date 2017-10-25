//
//  ProductListInteractor.m
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductListInteractor.h"
#import "ProductManager.h"
#import "SyncEngine.h"

@implementation ProductListInteractor

- (void)getProducts {
    [[SyncEngine sharedManager] startInitialSync:^(bool isSuccesful, NSError *error) {
        [self.manager getProducts:^(BOOL isSuccessful, NSError *error, NSArray *entries) {
            if (isSuccessful) {
                [self.output gotProducts:entries];
            } else {
            }
        }];
    }];
}

@end
