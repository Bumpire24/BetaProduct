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
#import "ManagedProduct.h"
#import "ProductListDisplayItem.h"
#import "NSArray+Utility.h"

@implementation ProductListInteractor
static NSString *kInitialSyncComplete = @"InitialSyncComplete";

#pragma mark - Use Cases

// Start an initial sync to Webservices to fill Core Data if first time installation
// Once Sync is done, mark the flag for initial sync completion
// Retrieve Data from here

- (void) checkIfInitialSyncComplete {
    if ([self isInitialSyncComplete]) {
        DDLogInfo(@"Already did Initial Sync. Skipping Initial Sync");
        [self retrieveProducts];
    } else {
        [self performInitialSync];
    }
}

- (void) performInitialSync {
    // TODO: Handle Error here
    DDLogInfo(@"Initial Sync started");
    [[SyncEngine sharedManager] startInitialSync:^(bool isSuccesful, NSError *error) {
        if (isSuccesful) {
            [self markInitialSyncAsComplete];
            [self retrieveProducts];
        } else {
        }
        DDLogInfo(@"Initial Sync ended");
    }];
}

- (void) retrieveProducts {
    // TODO: Handle error
    [self.manager getProducts:^(BOOL isSuccessful, NSError *error, NSArray *entries) {
        if (isSuccessful) {
            [self.output gotProducts:[self displayItemsFromProducts:entries]];
        } else {
            
        }
    }];
}

#pragma mark - ProductListInteractorInput

- (void)getProducts {
    [self checkIfInitialSyncComplete];
}

#pragma mark - Private

- (BOOL) isInitialSyncComplete {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kInitialSyncComplete];
}

- (void) markInitialSyncAsComplete {
    [[NSUserDefaults standardUserDefaults] setObject:kInitialSyncComplete forKey:kInitialSyncComplete];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSArray *) displayItemsFromProducts : (NSArray *) products {
    NSArray *items = (products != nil) ? products : @[];
    return [items arrayFromObjectsCollectedWithBlock:^id(ManagedProduct *product) {
        return [ProductListDisplayItem MakeProductListItemWithName:product.name WithDetail:product.productDescription WithURL:[NSURL URLWithString:product.imageThumbnailUrl]];
    }];
}

@end
