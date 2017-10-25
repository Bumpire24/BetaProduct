//
//  ManagedUser.m
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ManagedUser.h"
#import "BetaProject.h"
#import "DatabaseTypes.h"

@implementation ManagedUser

- (id) init {
    self = [super init];
    if (self) {
        self.firstName = @"";
        self.lastName = @"";
        self.username = @"";
        self.passsword = @"";
        self.email = @"";
        self.createdAt = [NSDate date];
        self.modifiedAt = [NSDate date];
        self.status = StatusActive;
    }
    return self;
}

+ (instancetype) MakeUserWithFirstName:(NSString *)firstName WithLastName:(NSString *)lastName WithEmail:(NSString *)email WithPassword:(NSString *)password WithUserName:(NSString *)username {
    ManagedUser *newUser = [[ManagedUser alloc] init];
    newUser.firstName = firstName;
    newUser.lastName = lastName;
    newUser.email = email;
    newUser.username = username;
    newUser.passsword = password;
    return newUser;
}

+ (instancetype) MakeUserWithFirstName:(NSString *)firstName WithLastName:(NSString *)lastName WithEmail:(NSString *)email WithPassword:(NSString *)password WithUserName:(NSString *)username WithCreatedDate:(NSDate *)createdAt WithModifiedDate:(NSDate *)modifiedAt WithStatus:(NSInteger)status {
    ManagedUser *newUser = [ManagedUser MakeUserWithFirstName:firstName WithLastName:lastName WithEmail:email WithPassword:password WithUserName:username];
    newUser.createdAt = createdAt;
    newUser.modifiedAt = modifiedAt;
    newUser.status = status;
    return newUser;
}

- (NSString *) fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
