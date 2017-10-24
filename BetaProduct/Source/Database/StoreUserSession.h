//
//  StoreDefaults.h
//  BetaProduct
//
//  Created by User on 10/19/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ManagedUser;

@interface StoreUserSession : NSObject

@property (nonatomic, strong) ManagedUser *user;
@property (nonatomic) bool isIndividual;
@property (nonatomic) bool isOrganizer;
@property (nonatomic) bool isAdmin;
@property (nonatomic) bool userTermsAccepted;
@property (nonatomic) bool organiserTermsAccepted;

+ (StoreUserSession *) userSession;
+ (void) MakeUserSessionWithUser : (ManagedUser *) user
                    isIndividual : (bool) isIndividual
                     isOrganizer : (bool) isOrganizer
                         isAdmin : (bool) isAdmin
               userTermsAccepted : (bool) userTermsAccepted
          organizerTermsAccepted : (bool) organizerTermsAccepted;

@end
