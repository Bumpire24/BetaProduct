//
//  ManagedProduct.m
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ManagedProduct.h"

@implementation ManagedProduct

+ (instancetype) MakeProductWithName:(NSString *)name WithDescription:(NSString *)description WithPrice:(NSString *)price WithPriceDescription:(NSString *)priceDescription WithLink:(NSString *)link WithImageLink:(NSString *)imageUrl WithCompanyImageLink:(NSString *)companyImageUrl WithProductId:(NSInteger)productId {
    return [ManagedProduct MakeProductWithName:name WithDescription:description WithPrice:price WithPriceDescription:priceDescription WithLink:link WithImageLink:imageUrl WithCompanyImageLink:companyImageUrl WithProductId:productId WithStatus:StatusActive];
}

+ (instancetype) MakeProductWithName:(NSString *)name WithDescription:(NSString *)description WithPrice:(NSString *)price WithPriceDescription:(NSString *)priceDescription WithLink:(NSString *)link WithImageLink:(NSString *)imageUrl WithCompanyImageLink:(NSString *)companyImageUrl WithProductId:(NSInteger)productId WithStatus:(Status)status {
    ManagedProduct *product = [[ManagedProduct alloc] init];
    product.name = name;
    product.productDescription = description;
    product.price = price;
    product.priceDescription = priceDescription;
    product.weblink = link;
    product.imageUrl = imageUrl;
    product.imageCompanyUrl = companyImageUrl;
    product.productId = (UInt32)productId;
    product.status = status;
    return product;
}

@end
