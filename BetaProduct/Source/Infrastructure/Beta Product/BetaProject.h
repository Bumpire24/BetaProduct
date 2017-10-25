//
//  BetaProjectInfo.h
//  BetaProduct
//
//  Created by User on 10/18/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BetaProject : NSObject

extern NSString* const kBetaProject_DatabaseName;
extern NSString* const kBetaProject_ErrorDomain;
extern NSString* const kBetaProject_GenericErrorName;
extern NSString* const kBetaProject_WSMainurl;

typedef NS_ENUM(NSInteger, BetaProjectError)
{
    BetaProjectErrorDatabase = 1000,
    BetaProjectErrorWS,
    BetaProjectErrorBusiness
};

// Events
- (NSString *) BetaProject_WSEventsCurrentGETurl;
- (NSString *) BetaProject_WSEventsGETurl : (NSString *) eventId;
- (NSString *) BetaProject_WSOrganizerGETurl : (NSString *) organizerId;
- (NSString *) BetaProject_WSOrganizerPOSTurl : (NSString *) organizerId;
- (NSString *) BetaProject_WSOrganizerDELETEurl : (NSString *) organizerId : (NSString *) eventId;
- (NSString *) BetaProject_WSOrganizerGETurl : (NSString *) organizerId : (NSString *) eventId;
- (NSString *) BetaProject_WSOrganizerPUTurl : (NSString *) organizerId : (NSString *) eventId;
- (NSString *) BetaProject_WSOrganizerPOSTrl : (NSString *) organizerId : (NSString *) eventId;

// Ping
- (NSString *) BetaProject_WSPingGeturl;

// User
- (NSString *) BetaProject_WSUserLoginPOSTurl;
- (NSString *) BetaProject_WSUserAuthPOSTurl;
- (NSString *) BetaProject_WSUserRegisterPOSTurl;
- (NSString *) BetaProject_WSUserProfileGETurl : (NSString *) userId;
- (NSString *) BetaProject_WSUserProfilePUTurl : (NSString *) userId;
- (NSString *) BetaProject_WSUserOrganizerPOSTurl : (NSString *) userId;

+ (NSURL *) BetaProject_WSmainurl;
+ (NSURL *) BetaProject_WSProductListGETurl;
+ (NSString *) WS_GET_ProductList;

@end
