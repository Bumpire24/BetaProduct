//
//  NSArray+Utility.h
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Utility)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id(^)(id object))block;

@end
