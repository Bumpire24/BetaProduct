//
//  ProductDetailWireframe.h
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "BaseWireframe.h"

@class ProductDetailPresenter;

@interface ProductDetailWireframe : BaseWireframe
@property (nonatomic, strong) ProductDetailPresenter *presenter;

- (void) pushProductDetailViewFromViewController : (UIViewController *) viewcontroller WithProductIndex : (NSInteger) index;
- (void) popProductDetailView;
@end
