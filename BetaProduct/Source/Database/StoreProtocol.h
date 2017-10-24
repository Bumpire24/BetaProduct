//
//  StoreProtocol.h
//  BetaProduct
//
//  Created by User on 10/17/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompletionBlockTypes.h"

@class User;
@class Product;

@protocol StoreProtocol <NSObject>

@optional

- (void) fetchEntriesWithEntityName: (NSString *) entityName
                    completionBlock: (CompletionBlockWithResults) completionBlock;

- (void) fetchEntriesWithEntityName: (NSString *) entityName
                          predicate: (NSPredicate *) predicate
                     sortDescriptor: (NSArray *) sortDescriptors
                    completionBlock: (CompletionBlockWithResults) completionBlock;

//- (void) insertNewEntryWithEntityName: (NSString *) entityName
//                               object: (id) object
//                      completionBlock: (StoreCompletionBlock) completionBlock;
//
//- (void) editEntryWithEntityName: (NSString *) entityName
//                          object: (id) object
//                 completionBlock: (StoreCompletionBlock) completionBlock;
//
//- (void) deleteEntryWithEntityName: (NSString *) entityName
//                            object: (id) object
//                   completionBlock: (StoreCompletionBlock) completionBlock;
//
//- (void) deleteEntryWithEntityName: (NSString *)entityName
//                          entityID: (int) entityID
//                   completionBlock: (StoreCompletionBlock)completionBlock;

- (User *) newUser;
- (Product *) newProduct;
- (void) deleteUser : (User *) user;

@end
