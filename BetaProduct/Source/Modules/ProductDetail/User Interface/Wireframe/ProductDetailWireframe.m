//
//  ProductDetailWireframe.m
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductDetailWireframe.h"
#import "ProductDetailPresenter.h"
#import "ProductDetailView.h"

static NSString *productDetailViewControllerIdentifier = @"ProductDetailView";

@interface ProductDetailWireframe()
@property (nonatomic, strong) UIViewController *presentedViewController;
@end

@implementation ProductDetailWireframe

- (void) pushProductDetailViewFromViewController : (UIViewController *) viewcontroller WithProductIndex:(NSInteger)index{
    ProductDetailView *view = [[self mainStoryboard] instantiateViewControllerWithIdentifier:productDetailViewControllerIdentifier];
    [view setSelectedProductIndex:index];
    view.eventHandler = self.presenter;
    self.presenter.view = view;
    self.presentedViewController = view;
    
    [viewcontroller.navigationController pushViewController:view animated:YES];
}

- (void) popProductDetailView {
    [self.presentedViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
