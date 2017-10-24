//
//  NSError+Utility.h
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Utility)

- (instancetype) initWithDomain: (NSErrorDomain) domain
                       WithCode: (NSInteger) code
                WithDescription: (NSString *) description
                     WithReason: (NSString *) reason
                 WithSuggestion: (NSString *) suggestion;

@end
