//
//  AppDependencies.m
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "AppDependencies.h"
#import "StoreWebClient.h"

@implementation AppDependencies

- (id) init {
    self = [super init];
    if (self) {
        [self configureDependencies];
    }
    return self;
}

- (void) configureDependencies {
    [StoreWebClient sharedManager];
}

- (void) installRootViewControllerInWindow:(UIWindow *)window {
    
}

@end
