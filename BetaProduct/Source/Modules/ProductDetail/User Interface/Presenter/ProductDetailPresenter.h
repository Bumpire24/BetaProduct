//
//  ProductDetailPresenter.h
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductDetailIO.h"
#import "ProductDetailModuleProtocol.h"
#import "ProductDetailWireframe.h"
#import "ProductDetailViewProtocol.h"

@interface ProductDetailPresenter : NSObject <ProductDetailInteractorOutput, ProductDetailModuleProtocol>
@property (nonatomic, strong) id<ProductDetailInteractorInput> interactor;
@property (nonatomic, strong) id<ProductDetailViewProtocol> view;
@property (nonatomic, strong) ProductDetailWireframe *detailwireframe;
@end
