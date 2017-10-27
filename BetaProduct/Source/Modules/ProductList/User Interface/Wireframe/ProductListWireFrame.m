//
//  ProductListWireFrame.m
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductListWireFrame.h"
#import "ProductListPresenter.h"
#import "ProductListView.h"
#import "RootWireFrame.h"

static NSString *ProductListViewIdentifier = @"ProductListView";

@interface ProductListWireFrame()
@property (nonatomic, strong) ProductListView *productListView;
@end

@implementation ProductListWireFrame

- (void)presentProductListInterfaceFromWindow:(UIWindow *)window {
    ProductListView *productListView = [self listViewControllerFromStoryboard];
    productListView.eventHandler = self.listPresenter;
    self.listPresenter.view = productListView;
    self.productListView = productListView;
    [self.rootWireframe showRootViewController:productListView inWindow:window];
}

- (ProductListView *)listViewControllerFromStoryboard {
    UIStoryboard *storyboard = [self mainStoryboard];
    ProductListView *viewController = [storyboard instantiateViewControllerWithIdentifier:ProductListViewIdentifier];
    return viewController;
}

- (UIStoryboard *)mainStoryboard {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    return storyboard;
}

@end
