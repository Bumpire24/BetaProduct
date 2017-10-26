//
//  SyncEngine.m
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "SyncEngine.h"
#import "StoreWebClient.h"
#import "BetaProject.h"
#import "StoreCore.h"
#import "Product.h"
#import "WSConverter.h"

@interface SyncEngine()
//@property (nonatomic, strong) NSMutableArray *registeredClassesForSync;
@property (nonatomic, strong) StoreCore *store;
@end

@implementation SyncEngine

#pragma mark - Private

#pragma mark - Public
- (void) startInitialSync : (CompletionBlock) block{
    [[StoreWebClient sharedManager] GET:BetaProject.WS_GET_ProductList withParameters:nil :^(bool isSuccesful, NSError *error, NSArray *results) {
        if (!isSuccesful) {
            DDLogError(@"Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
            block(isSuccesful, error);
        } else {
            __block NSError *GCDerror;
            dispatch_group_t downloadGroup = dispatch_group_create();
            
            for (NSDictionary *dict in results) {
                Product *product = [self.store newProduct];
                WSConverter *converter = [[WSConverter alloc] initWithDictionary:dict];
                product.productId = [converter numberWithKey:@"id"];
                product.name = [converter stringWithKey:@"title"];
                product.productDescription = [converter stringWithKey:@"body"];
                product.priceDescription = [converter stringWithKey:@"body"];
                product.imageUrl = [converter stringWithKey:@"thumbnailUrl"];
                product.status = StatusActive;
                product.syncStatus = SyncStatusSynced;
                product.createdAt = [NSDate date];
                product.modifiedAt = [NSDate date];
                dispatch_group_enter(downloadGroup);
                [self.store saveWithCompletionBlock:^(bool isSuccesful, NSError *error) {
                    if (!isSuccesful) {
                        DDLogError(@"Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
                    }
                    dispatch_group_leave(downloadGroup);
                }];
            }
            
            dispatch_group_notify(downloadGroup, dispatch_get_main_queue(), ^{
                if (block) {
                    block(true, GCDerror);
                }
            });
        }
    }];
}

+ (SyncEngine *) sharedManager {
    static SyncEngine *staticSyncEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticSyncEngine = [[SyncEngine alloc] init];
        staticSyncEngine.store = [[StoreCore alloc] init];
    });
    return staticSyncEngine;
}

@end
