//
//  StoreWebClientProtocol.h
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompletionBlockTypes.h"

@protocol StoreWebClientProtocol <NSObject>

@optional
- (void) GET : (NSString *) entity withParameters : (NSDictionary *) parameters : (CompletionBlockWithResults) block;
- (void) PUT : (NSString *) entity withParameters : (NSDictionary *) parameters : (CompletionBlockWithResults) block;
- (void) POST : (NSString *) entity withParameters : (NSDictionary *) parameters : (CompletionBlockWithResults) block;
- (void) DELETE : (NSString *) entity withParameters : (NSDictionary *) parameters : (CompletionBlockWithResults) block;

@end
