//
//  ProductDetailPresenter.m
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductDetailPresenter.h"
#import "ProductDetailDisplayItem.h"

@implementation ProductDetailPresenter

- (void)gotProductDisplayItem:(id)product {
    [self.view displayViewWithProductItem:product];
}

- (void) presentProductDetailWithIndex : (NSInteger) index{
    [self.interactor getProductById:(int)index];
}

@end
