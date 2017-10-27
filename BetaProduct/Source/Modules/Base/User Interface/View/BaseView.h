//
//  BaseView.h
//  BetaProduct
//
//  Created by User on 10/27/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIViewController

- (void) showProgressLoad;
- (void) hideProgressLoad;
- (void) hideProgressLoadWithComplete;
- (void) configureView;
- (void) configureLayout;

@end
