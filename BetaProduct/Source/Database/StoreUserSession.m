//
//  StoreDefaults.m
//  BetaProduct
//
//  Created by User on 10/19/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "StoreUserSession.h"
#import "ManagedUser.h"

@implementation StoreUserSession

+ (StoreUserSession *) userSession {
    static StoreUserSession *staticUserSession = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticUserSession = [[StoreUserSession alloc] init];
    });
    return staticUserSession;
}

+ (void) MakeUserSessionWithUser:(ManagedUser *)user isIndividual:(bool)isIndividual isOrganizer:(bool)isOrganizer isAdmin:(bool)isAdmin userTermsAccepted:(bool)userTermsAccepted organizerTermsAccepted:(bool)organizerTermsAccepted {
    [StoreUserSession userSession].user = user;
    [StoreUserSession userSession].isIndividual = isIndividual;
    [StoreUserSession userSession].isOrganizer = isOrganizer;
    [StoreUserSession userSession].isAdmin = isAdmin;
    [StoreUserSession userSession].userTermsAccepted = userTermsAccepted;
    [StoreUserSession userSession].organiserTermsAccepted = organizerTermsAccepted;
}

@end
