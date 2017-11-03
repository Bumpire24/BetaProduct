//
//  ProductManager.h
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "ManagedProduct.h"

@class StoreCore;

typedef void(^ManagerCompletionBlockWithResult)(BOOL isSuccessful, NSError *error, ManagedProduct *product);

@interface ProductManager : BaseManager

@property(nonatomic, strong) StoreCore* store;

- (void) getProducts : (ManagerCompletionBlockWithResults) block;
- (ManagedProduct *) getPersistedProductById : (int) index;

@end
