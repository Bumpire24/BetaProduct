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

static StoreWebClient *staticStoreWebClient = nil;

- (id) initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithArray:@[@"application/json"]]];
    }
    return self;
}

+ (StoreWebClient *) sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticStoreWebClient = [[StoreWebClient alloc] initWithBaseURL:[BetaProject BetaProject_WSmainurl] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return staticStoreWebClient;
}

- (void) GET:(NSString *)entity withParameters:(NSDictionary *)parameters :(CompletionBlockWithResults)block {
    [staticStoreWebClient GET:entity parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(true, nil, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(false, error, nil);
    }];
}

- (void) POST:(NSString *)entity withParameters:(NSDictionary *)parameters :(CompletionBlockWithResults)block {
    [staticStoreWebClient POST:entity parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(true, nil, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(false, error, nil);
    }];
}

- (void) PUT:(NSString *)entity withParameters:(NSDictionary *)parameters :(CompletionBlockWithResults)block {
    [staticStoreWebClient PUT:entity parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(true, nil, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(false, error, nil);
    }];
}

- (void) DELETE:(NSString *)entity withParameters:(NSDictionary *)parameters :(CompletionBlockWithResults)block {
    
}

@end
