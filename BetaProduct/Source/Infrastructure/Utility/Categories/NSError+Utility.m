//
//  NSError+Utility.m
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "NSError+Utility.h"

@implementation NSError (Utility)

- (instancetype) initWithDomain:(NSErrorDomain)domain
                       WithCode:(NSInteger)code
                WithDescription:(NSString *)description
                     WithReason:(NSString *)reason
                 WithSuggestion:(NSString *)suggestion {
    NSDictionary *userinfo = @{
                              NSLocalizedDescriptionKey : description,
                              NSLocalizedFailureReasonErrorKey : reason,
                              NSLocalizedRecoverySuggestionErrorKey : suggestion
                              };
    return [self initWithDomain:domain code:code userInfo:userinfo];
}

@end
