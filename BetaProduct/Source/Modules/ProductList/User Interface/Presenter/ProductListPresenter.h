//
//  ProductListPresenter.h
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductListInteractorIO.h"
#import "ProductListModuleProtocol.h"
#import "ProductListViewProtocol.h"
#import "ProductListWireFrame.h"

@interface ProductListPresenter : NSObject <ProductListInteractorOutput, ProductListModuleProtocol>

@property (nonatomic, strong) id<ProductListInteractorInput> interactor;
@property (nonatomic, strong) id<ProductListViewProtocol> view;
@property (nonatomic, strong) ProductListWireFrame *productListWireFrame;

@end
