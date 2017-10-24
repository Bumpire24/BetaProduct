//
//  ManagedUser.h
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManagedUser : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *passsword;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *modifiedAt;
@property (nonatomic) NSInteger status;

- (NSString *) fullName;
+ (instancetype) MakeUserWithFirstName: (NSString *) firstName
                          WithLastName: (NSString *) lastName
                             WithEmail: (NSString *) email
                          WithPassword: (NSString *) password
                          WithUserName: (NSString *) username;

+ (instancetype) MakeUserWithFirstName: (NSString *) firstName
                          WithLastName: (NSString *) lastName
                             WithEmail: (NSString *) email
                          WithPassword: (NSString *) password
                          WithUserName: (NSString *) username
                       WithCreatedDate: (NSDate *) createdAt
                      WithModifiedDate: (NSDate *) modifiedAt
                            WithStatus: (NSInteger) status;

@end
