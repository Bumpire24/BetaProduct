//
//  ProductDetailInteractor.h
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductDetailIO.h"

@class ProductManager;

@interface ProductDetailInteractor : NSObject <ProductDetailInteractorInput>
@property (nonatomic, strong) ProductManager *manager;
@property (nonatomic, strong) id<ProductDetailInteractorOutput> output;
@end
