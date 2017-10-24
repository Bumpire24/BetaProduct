//
//  StoreWeb.h
//  BetaProduct
//
//  Created by User on 10/19/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "StoreWebClientProtocol.h"

@interface StoreWebClient : AFHTTPSessionManager <StoreWebClientProtocol>

+ (StoreWebClient *) sharedManager;

@end
