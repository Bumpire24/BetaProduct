//
//  NSArray+Utility.m
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "NSArray+Utility.h"

@implementation NSArray (Utility)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id(^)(id object))block
{
    __block NSMutableArray *collection = [NSMutableArray arrayWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [collection addObject:block(obj)];
    }];
    
    return collection;
}

@end
