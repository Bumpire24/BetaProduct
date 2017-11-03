//
//  ProductManager.m
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductManager.h"
#import "StoreCore.h"
#import "Product.h"
#import "NSArray+Utility.h"
#import "NSError+Utility.h"
#import "BetaProject.h"

@interface ProductManager()
@property(nonatomic, strong) NSArray *retrievedConvertedProducts;
@end

@implementation ProductManager

- (id) init {
    self = [super init];
    if (self) {
        self.retrievedConvertedProducts = [[NSArray alloc] init];
    }
    return self;
}

- (void) getProducts:(ManagerCompletionBlockWithResults)block {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"status != %d", StatusDeleted];
    [self.store fetchEntriesWithEntityName:@"Product" predicate:predicate sortDescriptor:nil completionBlock:^(bool isSuccesful, NSError *error, NSArray *results) {
        __weak typeof(self) welf = self;
        if (isSuccesful) {
            if (results.count > 0) {
                self.retrievedConvertedProducts = [welf managedProductFromDataStoreEntries:results];
                block(isSuccesful, error, self.retrievedConvertedProducts);
            } else {
                NSError *errorResults = [[NSError alloc] initWithDomain:kBetaProject_ErrorDomain
                                                              WithCode:BetaProjectErrorDatabase
                                                       WithDescription:@"No Records Found"
                                                            WithReason:@"The table is empty"
                                                         WithSuggestion:@"Query may be wrong. Double Check"];
                DDLogError(@"BUMLOG ERROR : Description : %@, Reason : %@, Suggestion : %@",
                           errorResults.localizedDescription,
                           errorResults.localizedFailureReason,
                           errorResults.localizedFailureReason);
                block(false, errorResults, @[]);
            }
        } else {
            block(isSuccesful, error, @[]);
        }
    }];
}

- (ManagedProduct *) getPersistedProductById:(int)index {
    if (self.retrievedConvertedProducts != nil) {
        if ([self.retrievedConvertedProducts objectAtIndex:index]) {
            return [self.retrievedConvertedProducts objectAtIndex:index];
        }
    }
    return nil;
}

- (NSArray *)managedProductFromDataStoreEntries:(NSArray *)entries
{
    return [entries arrayFromObjectsCollectedWithBlock:^id(Product *product) {
        return [ManagedProduct MakeProductWithName:product.name
                                   WithDescription:product.productDescription
                                         WithPrice:product.price
                              WithPriceDescription:product.priceDescription
                                          WithLink:product.weblink
                                     WithImageLink:product.imageUrl
                                WithImageThumbLink:product.imageThumbUrl
                              WithCompanyImageLink:product.imageCompanyUrl
                                     WithProductId:product.productId.integerValue
                                        WithStatus:product.status];
    }];
}

@end
