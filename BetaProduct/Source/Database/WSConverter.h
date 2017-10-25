//
//  WSConverter.h
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSConverter : NSObject

- (id) initWithDictionary : (NSDictionary *) dict;
- (NSString *) stringWithKey : (NSString *) key;
- (NSDate *) dateWithKey : (NSString *) key;
- (UInt16) int16Withkey : (NSString *) key;
- (UInt32) int32WithKey : (NSString *) key;
- (NSInteger) intWithKey : (NSString *) key;
- (NSNumber *) numberWithKey : (NSString *) key;

@end
