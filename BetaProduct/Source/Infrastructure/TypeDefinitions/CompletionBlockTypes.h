//
//  CompletionBlockTypes.h
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompletionBlockTypes : NSObject

typedef void(^CompletionBlockWithResults)(bool isSuccesful, NSError *error, NSArray *results);
typedef void(^CompletionBlock)(bool isSuccesful, NSError *error);

@end
