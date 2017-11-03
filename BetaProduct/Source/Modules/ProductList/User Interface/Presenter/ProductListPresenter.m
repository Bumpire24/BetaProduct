//
//  ProductListPresenter.m
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductListPresenter.h"

@implementation ProductListPresenter

- (void)gotProducts:(NSArray *)products {
    if (products.count == 0) {
        [self.view showNoContentMessage];
    } else {
        [self.view showProductList:products];
    }
}

- (void)updateView {
    [self.interactor getProducts];
}

- (void) presentDetailViewOfProductIndex : (NSInteger) index {
    [self.productListWireFrame presentProductDetailViewWithProductIndex:index];
}

@end
