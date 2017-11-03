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
#import "ProductDetailWireframe.h"

static NSString *ProductListViewIdentifier = @"ProductListView";

@interface ProductListWireFrame()
@property (nonatomic, strong) ProductListView *productListView;
@end

@implementation ProductListWireFrame

- (ProductListView *) productListInterfaceForHomeRegistry {
    ProductListView *viewcontroller = [[self mainStoryboard] instantiateViewControllerWithIdentifier:ProductListViewIdentifier];
    viewcontroller.eventHandler = self.listPresenter;
    self.listPresenter.view = viewcontroller;
    self.productListView = viewcontroller;
    return viewcontroller;
}

- (void) presentProductDetailViewWithProductIndex : (NSInteger) index {
    [self.detailWireframe pushProductDetailViewFromViewController:self.productListView WithProductIndex:index];
}

@end
