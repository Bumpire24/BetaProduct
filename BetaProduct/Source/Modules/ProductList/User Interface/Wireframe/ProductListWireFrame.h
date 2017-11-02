//
//  ProductListWireFrame.h
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "BaseWireframe.h"

@class ProductListPresenter;
@class RootWireFrame;
@class HomeWireframe;
@class ProductListView;

@interface ProductListWireFrame : BaseWireframe

@property (nonatomic, strong) ProductListPresenter *listPresenter;
@property (nonatomic, strong) HomeWireframe *homeWireFrame;

- (ProductListView *) productListInterfaceForHomeRegistry;

@end
