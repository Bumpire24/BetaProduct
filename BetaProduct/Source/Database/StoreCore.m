//
//  StoreCore.m
//  BetaProduct
//
//  Created by User on 10/17/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "StoreCore.h"
#import <CoreData/CoreData.h>
#import "BetaProject.h"
#import "NSError+Utility.h"
#import "User.h"
#import "SyncEngine.h"

@interface StoreCore()

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation StoreCore

- (id)init
{
    if ((self = [super init]))
    {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        NSError *error = nil;
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:kBetaProject_DatabaseName];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:options error:&error];
        
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
//        _managedObjectContext.undoManager = nil;
    }
    return self;
}

#pragma mark - Public
- (void) save {
    [self.managedObjectContext save: NULL];
}

- (void) saveWithCompletionBlock: (CompletionBlock) completionBlock {
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    if (!error) {
        completionBlock(true, error);
    } else {
        completionBlock(false, error);
    }
}

- (void) saveOrRollback {
    NSError *error = nil;
    [self.managedObjectContext save: &error];
    if (error) {
        [self.managedObjectContext rollback];
    }
}

- (void) saveOrRollback:(CompletionBlock)completionBlock {
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    if (!error) {
        completionBlock(true, error);
    } else {
        [self.managedObjectContext rollback];
        completionBlock(false, error);
    }
}

#pragma mark - StoreProtocol
- (void) fetchEntriesWithEntityName:(NSString *)entityName completionBlock:(CompletionBlockWithResults)completionBlock {
    [self fetchEntriesWithEntityName:entityName predicate:nil sortDescriptor:nil completionBlock:completionBlock];
}

- (void) fetchEntriesWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate sortDescriptor:(NSArray *)sortDescriptors completionBlock:(CompletionBlockWithResults)completionBlock {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext];
    
    if (entity != nil) {
        [fetchRequest setEntity:entity];
    } else {
        NSError *error = [[NSError alloc] initWithDomain:kBetaProject_ErrorDomain WithCode:BetaProjectErrorDatabase WithDescription:kBetaProject_GenericErrorName WithReason:@"Entity Does Not Exist" WithSuggestion:@"Double Check Entity Names"];
        completionBlock(false, error, nil);
        return;
    }
    
    if (predicate != nil) {
        [fetchRequest setPredicate:predicate];
    }
    
    if (sortDescriptors != nil) {
        [fetchRequest setSortDescriptors:sortDescriptors];
    }
    
    [self.managedObjectContext performBlock:^{
        NSError *error = nil;
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        if (!error) {
            completionBlock(true, error, results);
        } else {
            completionBlock(false, error, nil);
        }
    }];
}

- (User *) newUser {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    User *newEntry = (User *)[[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.managedObjectContext];
    return newEntry;
}

- (Product *) newProduct {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
    Product *newEntry = (Product *)[[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.managedObjectContext];
    return newEntry;
}

- (void) deleteUser: (User *)user {
    [self.managedObjectContext deleteObject:user];
}

@end
