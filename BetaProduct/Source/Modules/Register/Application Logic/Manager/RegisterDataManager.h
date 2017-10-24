//
//  RegisterDataManager.h
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ManagedUser;
@class StoreCore;

typedef void(^DataManagerCompletionBlockWithResults)(BOOL isSuccesful, NSError *error, NSArray *entries);
typedef void(^DataManagerCompletionBlockWithResult)(BOOL isSuccesful, NSError *error, ManagedUser *user);
typedef void(^DataManagerCompletionBlock)(BOOL isSuccesful, NSError *error);

@interface RegisterDataManager : NSObject

@property(nonatomic, strong) StoreCore* store;

- (void) createNewUser : (ManagedUser *) user withCompletionBlock : (DataManagerCompletionBlock) completionBlock;
- (void) updateUser : (ManagedUser *) user withCompletionBlock : (DataManagerCompletionBlock) completionBlock;
- (void) deleteUserSoftly : (ManagedUser *) user withCompletionBlock : (DataManagerCompletionBlock) completionBlock;
- (void) deleteUser : (ManagedUser *) user withCompletionBlock : (DataManagerCompletionBlock) completionBlock;
- (void) getUserByFirstName : (NSString *) firstName andLastName : (NSString *) lastName withCompletionBlock : (DataManagerCompletionBlockWithResult) completionBlock;
- (void) getUsers : (DataManagerCompletionBlockWithResults) completionBlock;

@end
