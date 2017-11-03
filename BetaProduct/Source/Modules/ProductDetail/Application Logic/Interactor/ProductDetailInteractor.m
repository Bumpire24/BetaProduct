//
//  ProductDetailInteractor.m
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductDetailInteractor.h"
#import "ProductManager.h"
#import "ProductDetailDisplayItem.h"
#import "ManagedProduct.h"

@implementation ProductDetailInteractor

- (void)getProductById:(int)index {
    ManagedProduct *product = [self.manager getPersistedProductById:index];
    [self.output gotProductDisplayItem:[ProductDetailDisplayItem MakeProductDetailDisplayItemWithName:product.name
                                                                                          WithWebLink:product.weblink
                                                                               WithProductDescription:product.productDescription
                                                                                            WithPrice:product.price
                                                                                 WithPriceDescription:product.priceDescription
                                                                                         WithImageURL:product.imageUrl
                                                                                       WithCompanyURL:product.imageCompanyUrl]];
}

@end
