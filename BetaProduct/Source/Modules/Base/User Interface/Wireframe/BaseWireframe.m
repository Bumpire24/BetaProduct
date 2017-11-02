//
//  BaseWireframe.m
//  BetaProduct
//
//  Created by User on 11/2/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "BaseWireframe.h"

@implementation BaseWireframe

#pragma mark - Public
- (UIStoryboard *) mainStoryboard {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    return storyboard;
}

@end
