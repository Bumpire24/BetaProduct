//
//  ProductDetailVIew.h
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "BaseView.h"
#import "ProductDetailViewProtocol.h"
#import "ProductDetailModuleProtocol.h"

@interface ProductDetailView : BaseView <ProductDetailViewProtocol> 
@property (nonatomic, strong) id<ProductDetailModuleProtocol> eventHandler;
@end
