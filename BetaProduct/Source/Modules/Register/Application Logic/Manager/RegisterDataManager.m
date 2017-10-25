//
//  RegisterDataManager.m
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "RegisterDataManager.h"
#import "ManagedUser.h"
#import "StoreCore.h"
#import "User.h"
#import "NSArray+Utility.h"
#import "NSError+Utility.h"
#import "BetaProject.h"
#import "DatabaseTypes.h"

@implementation RegisterDataManager

- (void) createNewUser:(ManagedUser *)user withCompletionBlock:(DataManagerCompletionBlock)completionBlock {
    User *newUser = [self.store newUser];
    newUser.firstname = user.firstName;
    newUser.lastname = user.lastName;
    newUser.email = user.email;
    newUser.username = user.username;
    newUser.password = user.passsword;
    newUser.status = user.status;
    newUser.createdAt = user.createdAt;
    newUser.modifiedAt = user.modifiedAt;
    newUser.syncStatus = SyncStatusSynced;
    [self.store saveWithCompletionBlock:^(bool isSuccesful, NSError *error) {
        completionBlock(isSuccesful, error);
    }];
}

- (void) updateUser:(ManagedUser *)user withCompletionBlock:(DataManagerCompletionBlock)completionBlock {
    // Retrieve User First
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"createdAt = %@ AND modifiedAt = %@ AND status != %d",user.createdAt, user.modifiedAt, StatusDeleted];
    [self.store fetchEntriesWithEntityName:@"User" predicate:predicate sortDescriptor:nil completionBlock:^(bool isSuccesful, NSError *error, NSArray *results) {
        if (isSuccesful) {
            if (results.count > 0) {
                // Modify User
                User *updateUser = (User *)results.firstObject;
                updateUser.firstname = user.firstName;
                updateUser.lastname = user.lastName;
                updateUser.email = user.email;
                updateUser.username = user.username;
                updateUser.password = user.passsword;
                updateUser.status = user.status;
                updateUser.modifiedAt = [NSDate date];
                [self.store saveWithCompletionBlock:^(bool isSuccesful, NSError *error) {
                    completionBlock(isSuccesful, error);
                }];
            } else {
                completionBlock(false, [[NSError alloc] initWithDomain:kBetaProject_ErrorDomain WithCode:BetaProjectErrorDatabase WithDescription:@"No Record Found" WithReason:@"Record does not Exist" WithSuggestion:@"Query may be wrong. Double Check"]);
            }
        } else {
            completionBlock(isSuccesful, error);
        }
    }];
}

- (void) deleteUser:(ManagedUser *)user withCompletionBlock:(DataManagerCompletionBlock)completionBlock {
    // Retrieve User First
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"createdAt = %@ AND modifiedAt = %@ AND status != %d",user.createdAt, user.modifiedAt, StatusDeleted];
    [self.store fetchEntriesWithEntityName:@"User" predicate:predicate sortDescriptor:nil completionBlock:^(bool isSuccesful, NSError *error, NSArray *results) {
        if (isSuccesful) {
            if (results.count > 0) {
                // If User was found, delete
                User *user = (User *)results.firstObject;
                [self.store deleteUser:user];
                [self.store saveWithCompletionBlock:^(bool isSuccesful, NSError *error) {
                    if (isSuccesful) {
                        completionBlock(isSuccesful, error);
                    } else {
                        completionBlock(isSuccesful, [[NSError alloc] initWithDomain:kBetaProject_ErrorDomain WithCode:BetaProjectErrorDatabase WithDescription:kBetaProject_GenericErrorName WithReason:@"Record cannot be deleted" WithSuggestion:@"Double Check Query"]);
                    }
                }];
            } else {
                completionBlock(false, [[NSError alloc] initWithDomain:kBetaProject_ErrorDomain WithCode:BetaProjectErrorDatabase WithDescription:@"No Record Found" WithReason:@"Record does not Exist" WithSuggestion:@"Query may be wrong. Double Check"]);
            }
        } else {
            completionBlock(isSuccesful, error);
        }
    }];
}

- (void) deleteUserSoftly:(ManagedUser *)user withCompletionBlock:(DataManagerCompletionBlock)completionBlock {
    // Retrieve User First
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"createdAt = %@ AND modifiedAt = %@ AND status != %d",user.createdAt, user.modifiedAt, StatusDeleted];
    [self.store fetchEntriesWithEntityName:@"User" predicate:predicate sortDescriptor:nil completionBlock:^(bool isSuccesful, NSError *error, NSArray *results) {
        if (isSuccesful) {
            if (results.count > 0) {
                // Modify User
                User *updateUser = (User *)results.firstObject;
                updateUser.status = StatusDeleted;
                [self.store saveWithCompletionBlock:^(bool isSuccesful, NSError *error) {
                    completionBlock(isSuccesful, error);
                }];
            } else {
                completionBlock(false, [[NSError alloc] initWithDomain:kBetaProject_ErrorDomain WithCode:BetaProjectErrorDatabase WithDescription:@"No Record Found" WithReason:@"Record does not Exist" WithSuggestion:@"Query may be wrong. Double Check"]);
            }
        } else {
            completionBlock(isSuccesful, error);
        }
    }];
}

- (void) getUserByFirstName:(NSString *)firstName andLastName:(NSString *)lastName withCompletionBlock:(DataManagerCompletionBlockWithResult)completionBlock {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstname = %@ AND lastname = %@ AND status != %d",firstName, lastName, StatusDeleted];
    [self.store fetchEntriesWithEntityName:@"User" predicate:predicate sortDescriptor:nil completionBlock:^(bool isSuccesful, NSError *error, NSArray *results) {
        if (isSuccesful) {
            if (results.count > 0) {
                User *user = (User *)results.firstObject;
                completionBlock(isSuccesful, error, [ManagedUser MakeUserWithFirstName:user.firstname WithLastName:user.lastname WithEmail:user.email WithPassword:user.password WithUserName:user.username WithCreatedDate:user.createdAt WithModifiedDate:user.modifiedAt WithStatus:user.status]);
            } else {
                completionBlock(false, [[NSError alloc] initWithDomain:kBetaProject_ErrorDomain WithCode:BetaProjectErrorDatabase WithDescription:@"No Record Found" WithReason:@"Record does not Exist" WithSuggestion:@"Query may be wrong. Double Check"], nil);
            }
        } else {
            completionBlock(isSuccesful, error, nil);
        }
    }];
}

- (void) getUsers:(DataManagerCompletionBlockWithResults)completionBlock {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"status != %d", StatusDeleted];
    [self.store fetchEntriesWithEntityName:@"User" predicate:predicate sortDescriptor:nil completionBlock:^(bool isSuccesful, NSError *error, NSArray *results) {
        __weak typeof(self) welf = self;
        if (isSuccesful) {
            if (results.count > 0) {
                completionBlock(isSuccesful, error, [welf managedUserFromDataStoreEntries:results]);
            } else {
                completionBlock(false, [[NSError alloc] initWithDomain:kBetaProject_ErrorDomain WithCode:BetaProjectErrorDatabase WithDescription:@"No Records Found" WithReason:@"The table is empty" WithSuggestion:@"Query may be wrong. Double Check"], nil);
            }
        } else {
            completionBlock(isSuccesful, error, nil);
        }
    }];
}

- (NSArray *)managedUserFromDataStoreEntries:(NSArray *)entries
{
    return [entries arrayFromObjectsCollectedWithBlock:^id(User *user) {
        return [ManagedUser MakeUserWithFirstName:user.firstname WithLastName:user.lastname WithEmail:user.email WithPassword:user.password WithUserName:user.username WithCreatedDate:user.createdAt WithModifiedDate:user.modifiedAt WithStatus:user.status];
    }];
}

@end
