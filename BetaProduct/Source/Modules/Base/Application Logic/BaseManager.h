//
//  BaseManager.h
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ManagerCompletionBlockWithResults)(BOOL isSuccessful, NSError *error, NSArray *entries);
typedef void(^ManagerCompletionBlock)(BOOL isSuccessful, NSError *error);

@interface BaseManager : NSObject

@end
