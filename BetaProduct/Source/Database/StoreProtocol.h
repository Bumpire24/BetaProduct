//
//  StoreProtocol.h
//  BetaProduct
//
//  Created by User on 10/17/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

typedef void(^StoreCompletionBlockWithResults)(bool isSuccesful, NSError *error, NSArray *results);
typedef void(^StoreCompletionBlock)(bool isSuccesful, NSError *error);

@protocol StoreProtocol <NSObject>

@optional

- (void) fetchEntriesWithEntityName: (NSString *) entityName
                    completionBlock: (StoreCompletionBlockWithResults) completionBlock;

- (void) fetchEntriesWithEntityName: (NSString *) entityName
                          predicate: (NSPredicate *) predicate
                     sortDescriptor: (NSArray *) sortDescriptors
                    completionBlock: (StoreCompletionBlockWithResults) completionBlock;

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
- (void) deleteUser : (User *) user;

@end
