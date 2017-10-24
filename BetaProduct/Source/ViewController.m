//
//  ViewController.m
//  BetaProduct
//
//  Created by User on 10/17/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ViewController.h"
#import "RegisterDataManager.h"
#import "ManagedUser.h"
#import "BetaProject.h"
#import "StoreCore.h"
#import "StoreUserSession.h"
#import "StoreWebClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Scratch Pad
    StoreCore *store = [[StoreCore alloc] init];
    RegisterDataManager *manager = [[RegisterDataManager alloc] init];
    
    manager.store = store;
    
    //ManagedUser *user = [ManagedUser MakeUserWithFirstName:@"" WithLastName:@"" WithEmail:@"" WithPassword:@"" WithUserName:@""];
    
    [manager getUsers:^(BOOL isSuccesful, NSError *error, NSArray *entries) {
        NSLog(@"%@", entries.firstObject);
    }];
    
//    [manager createNewUser:user withCompletionBlock:^(BOOL isSuccesful, NSError *error) {
//        if (!isSuccesful) {
//            NSLog(@"BUMLOG ERROR : Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
//        }
//    }];
    
//    [[StoreWebClient sharedManager] GET:@"https://jsonplaceholder.typicode.com/photos" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"call");
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        ;
//    }];
    
//    NSDictionary *params = @{@"data" : @"data"
//                                 };
//
//    [[StoreWebClient sharedManager] POST:@"https://jsonplaceholder.typicode.com/posts" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
//        ;
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        ;
//    }];
//
//    [manager getUsers:^(BOOL isSuccesful, NSError *error, NSArray *entries) {
//        if (isSuccesful) {
//            [entries enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                ManagedUser *user = (ManagedUser *) obj;
//                NSLog(@"%lu. %@", (unsigned long)idx, user.fullName);
//            }];
//        } else {
//            NSLog(@"BUMLOG ERROR : Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
//        }
//    }];
//
//    [manager getUserByFirstName:@"TEST1" andLastName:@"TEST" withCompletionBlock:^(BOOL isSuccesful, NSError *error, ManagedUser *user) {
//        if (isSuccesful) {
//            NSLog(@"%@", user.fullName);
//        } else {
//            NSLog(@"BUMLOG ERROR : Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
//        }
//    }];
    
//    [manager getUserByFirstName:@"Sample1" andLastName:@"Sample2" withCompletionBlock:^(BOOL isSuccesful, NSError *error, ManagedUser *user) {
//        if (isSuccesful) {
//            [manager deleteUser:user withCompletionBlock:^(BOOL isSuccesful, NSError *error) {
//                if (isSuccesful) {
//                    NSLog(@"DELETION SUCCESS!");
//                } else {
//                    NSLog(@"BUMLOG ERROR : Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
//                }
//            }];
//        } else {
//            NSLog(@"BUMLOG ERROR : Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
//        }
//    }];
    
//    [manager getUserByFirstName:@"TEST" andLastName:@"TEST" withCompletionBlock:^(BOOL isSuccesful, NSError *error, ManagedUser *user) {
//        if (isSuccesful) {
//            user.firstName = @"Sample1";
//            user.lastName = @"Sample2";
//            [manager updateUser:user withCompletionBlock:^(BOOL isSuccesful, NSError *error) {
//                if (isSuccesful) {
//                    NSLog(@"UPDATION SUCCESS!");
//                } else {
//                    NSLog(@"BUMLOG ERROR : Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
//                }
//            }];
//        } else {
//            NSLog(@"BUMLOG ERROR : Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
//        }
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
