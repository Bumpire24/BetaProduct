//
//  StoreWeb.m
//  BetaProduct
//
//  Created by User on 10/19/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "StoreWebClient.h"
#import "BetaProject.h"

@interface StoreWebClient()

@end

@implementation StoreWebClient

- (id) initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithArray:@[@"application/json"]]];
    }
    return self;
}

+ (StoreWebClient *) sharedManager {
    static StoreWebClient *staticStoreWebClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticStoreWebClient = [[StoreWebClient alloc] initWithBaseURL:[BetaProject BetaProject_WSmainurl] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return staticStoreWebClient;
}

@end
