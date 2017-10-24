//
//  AppDependencies.m
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "AppDependencies.h"
#import "StoreWebClient.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import "SyncEngine.h"

@implementation AppDependencies

- (id) init {
    self = [super init];
    if (self) {
        [self configureApp];
        [self configureLibraries];
        [self configureDependencies];
    }
    return self;
}

- (void) configureApp {
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void) configureLibraries {
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [AFNetworkActivityIndicatorManager sharedManager].activationDelay = 0;
    
    [[SyncEngine sharedManager] startInitialSync:^(bool isSuccesful, NSError *error) {
        ;
    }];
}

- (void) configureDependencies {

}

- (void) installRootViewControllerInWindow:(UIWindow *)window {
    
}

@end
