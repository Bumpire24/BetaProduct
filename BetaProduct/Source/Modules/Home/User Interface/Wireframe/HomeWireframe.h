//
//  HomeWireframe.h
//  BetaProduct
//
//  Created by User on 11/2/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseWireframe.h"

@class RootWireFrame;
@class ProductListWireFrame;

@interface HomeWireframe : BaseWireframe

@property (nonatomic, strong) RootWireFrame *rootWireFrame;
@property (nonatomic, strong) ProductListWireFrame *productListWireFrame;

- (void)presentHomeViewInterfaceFromWindow:(UIWindow*)window;

@end
