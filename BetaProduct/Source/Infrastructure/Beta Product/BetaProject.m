//
//  BetaProjectConstants.m
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "BetaProject.h"

@implementation BetaProject

NSString* const kBetaProject_DatabaseName = @"BetaProject.sqlite";
NSString* const kBetaProject_ErrorDomain = @"BetaProjectErrorDomain";
NSString* const kBetaProject_GenericErrorName = @"Something went wrong";
//NSString* const kBetaProject_WSMainurl = @"http://webappf1triptygodev.azurewebsites.net/";
NSString* const kBetaProject_WSMainurl = @"http://jsonplaceholder.typicode.com/";

- (NSString *) BetaProject_WSEventsCurrentGETurl {
    return [NSString stringWithFormat:@"%@/events/current", kBetaProject_WSMainurl];
}

- (NSString *) BetaProject_WSEventsGETurl : (NSString *) eventId {
    return [NSString stringWithFormat:@"%@/events/%@", kBetaProject_WSMainurl, eventId];
}

- (NSString *) BetaProject_WSOrganizerGETurl : (NSString *) organizerId{
    return [NSString stringWithFormat:@"%@/organizer/%@/events", kBetaProject_WSMainurl, organizerId];
}

- (NSString *) BetaProject_WSOrganizerPOSTurl : (NSString *) organizerId {
    return [NSString stringWithFormat:@"%@/organizer/%@/events", kBetaProject_WSMainurl, organizerId];
}

- (NSString *) BetaProject_WSOrganizerDELETEurl : (NSString *) organizerId : (NSString *) eventId {
    return [NSString stringWithFormat:@"%@/organizer/%@/events/%@", kBetaProject_WSMainurl, organizerId, eventId];
}

- (NSString *) BetaProject_WSOrganizerGETurl : (NSString *) organizerId : (NSString *) eventId {
    return [NSString stringWithFormat:@"%@/organizer/%@/events/%@", kBetaProject_WSMainurl, organizerId, eventId];
}

- (NSString *) BetaProject_WSOrganizerPUTurl : (NSString *) organizerId : (NSString *) eventId {
    return [NSString stringWithFormat:@"%@/organizer/%@/events/%@", kBetaProject_WSMainurl, organizerId, eventId];
}

- (NSString *) BetaProject_WSOrganizerPOSTrl : (NSString *) organizerId : (NSString *) eventId {
    return [NSString stringWithFormat:@"%@/organizer/%@/events/%@/publish", kBetaProject_WSMainurl, organizerId, eventId];
}

- (NSString *) BetaProject_WSPingGeturl {
    return [NSString stringWithFormat:@"%@/ping", kBetaProject_WSMainurl];
}

- (NSString *) BetaProject_WSUserLoginPOSTurl {
    return [NSString stringWithFormat:@"%@/users/login", kBetaProject_WSMainurl];
}

- (NSString *) BetaProject_WSUserAuthPOSTurl {
    return [NSString stringWithFormat:@"%@/users/auth", kBetaProject_WSMainurl];
}

- (NSString *) BetaProject_WSUserRegisterPOSTurl {
    return [NSString stringWithFormat:@"%@/users/register", kBetaProject_WSMainurl];
}

- (NSString *) BetaProject_WSUserProfileGETurl : (NSString *) userId {
    return [NSString stringWithFormat:@"%@/users/%@/profile", kBetaProject_WSMainurl, userId];
}

- (NSString *) BetaProject_WSUserProfilePUTurl : (NSString *) userId {
    return [NSString stringWithFormat:@"%@/users/%@/profile", kBetaProject_WSMainurl, userId];
}

- (NSString *) BetaProject_WSUserOrganizerPOSTurl : (NSString *) userId {
    return [NSString stringWithFormat:@"%@/users/%@/become-organizer", kBetaProject_WSMainurl, userId];
}

+ (NSURL *) BetaProject_WSmainurl {
    return [NSURL URLWithString:kBetaProject_WSMainurl];
}

+ (NSURL *) BetaProject_WSProductListGETurl {
    return [NSURL URLWithString:@"posts" relativeToURL:[self BetaPRoject_URLmainurl]];
}

+ (NSURL *) BetaPRoject_URLmainurl {
    return [NSURL URLWithString:kBetaProject_WSMainurl];
}

+ (NSString *) WS_GET_ProductList {
    return  [NSString stringWithFormat:@"%@posts", kBetaProject_WSMainurl];
}


@end
