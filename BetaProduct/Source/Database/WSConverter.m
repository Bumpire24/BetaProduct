//
//  WSConverter.m
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "WSConverter.h"
#import "NSError+Utility.h"
#import "BetaProject.h"

@interface WSConverter()
@property (nonatomic, strong) NSDictionary *dataDict;
@end

@implementation WSConverter

- (id) initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.dataDict = dict;
    }
    return self;
}

- (void) logErrorKeyNotFound : (NSString *) key {
    NSError *error = [[NSError alloc] initWithDomain:kBetaProject_ErrorDomain
                                            WithCode:BetaProjectErrorWS
                                     WithDescription:[NSString stringWithFormat:@"Key : %@ was not found", key]
                                          WithReason:@"Key/Object does not exist in Dictionary"
                                      WithSuggestion:@"Check Data Dictionary, data could either be null or none at all"];
    DDLogError(@"BUMLOG ERROR : Description : %@, Reason : %@, Suggestion : %@, Error : %@", error.localizedDescription, error.localizedFailureReason, error.localizedFailureReason, error);
}

- (NSString *) stringWithKey : (NSString *) key {
    NSString *value = @"";
    if ([self.dataDict objectForKey:key]) {
        value = [self.dataDict objectForKey:key];
    } else {
        [self logErrorKeyNotFound:key];
    }
    return value;
}

- (NSDate *) dateWithKey : (NSString *) key {
    NSDate *value = nil;
    if ([self.dataDict objectForKey:key]) {
        value = [self.dataDict objectForKey:key];
    } else {
        [self logErrorKeyNotFound:key];
    }
    return value;
}

- (UInt16) int16Withkey : (NSString *) key {
    UInt16 value = 0;
    if ([self.dataDict objectForKey:key]) {
        value = [[self.dataDict objectForKey:key] intValue];
    } else {
        [self logErrorKeyNotFound:key];
    }
    return value;
}

- (UInt32) int32WithKey : (NSString *) key {
    UInt32 value = 0;
    if ([self.dataDict objectForKey:key]) {
        value = [[self.dataDict objectForKey:key] intValue];
    } else {
        [self logErrorKeyNotFound:key];
    }
    return value;
}

- (NSInteger) intWithKey : (NSString *) key {
    UInt32 value = 0;
    if ([self.dataDict objectForKey:key]) {
        value = [[self.dataDict objectForKey:key] intValue];
    } else {
        [self logErrorKeyNotFound:key];
    }
    return value;
}

- (NSNumber *) numberWithKey:(NSString *)key {
    NSNumber *value = 0;
    if ([self.dataDict objectForKey:key]) {
        value = [NSNumber numberWithInteger:[[self.dataDict objectForKey:key] integerValue]];
    } else {
        [self logErrorKeyNotFound:key];
    }
    return value;
}

@end
