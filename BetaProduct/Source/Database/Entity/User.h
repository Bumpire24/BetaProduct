//
//  User.h
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "BaseEntity.h"

@interface User : BaseEntity

@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *firstname;
@property (nullable, nonatomic, copy) NSString *lastname;
@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSString *username;

@end
