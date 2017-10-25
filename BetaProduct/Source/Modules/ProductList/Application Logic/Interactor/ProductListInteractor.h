//
//  ProductListInteractor.h
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductListInteractorIO.h"

@class ProductManager;

@interface ProductListInteractor : NSObject <ProductListInteractorInput>

@property (nonatomic, strong) ProductManager *manager;
@property (nonatomic, strong) id<ProductListInteractorOutput> output;

@end
