//
//  ProductListWireFrame.h
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ProductListPresenter;
@class RootWireFrame;

@interface ProductListWireFrame : NSObject

@property (nonatomic, strong) ProductListPresenter *listPresenter;
@property (nonatomic, strong) RootWireFrame *rootWireframe;

- (void)presentProductListInterfaceFromWindow:(UIWindow *)window;

@end
