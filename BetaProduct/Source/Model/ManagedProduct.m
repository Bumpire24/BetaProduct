//
//  ManagedProduct.m
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ManagedProduct.h"

@implementation ManagedProduct

+ (instancetype) MakeProductWithName:(NSString *)name WithDescription:(NSString *)description WithPrice:(NSString *)price WithPriceDescription:(NSString *)priceDescription WithLink:(NSString *)link WithImageLink:(NSString *)imageUrl WithImageThumbLink: (NSString *) imageThumbnailUrl WithCompanyImageLink:(NSString *)companyImageUrl WithProductId:(NSUInteger)productId {
    return [ManagedProduct MakeProductWithName:name WithDescription:description WithPrice:price WithPriceDescription:priceDescription WithLink:link WithImageLink:imageUrl WithImageThumbLink: imageThumbnailUrl WithCompanyImageLink:companyImageUrl WithProductId:productId WithStatus:StatusActive];
}

+ (instancetype) MakeProductWithName:(NSString *)name WithDescription:(NSString *)description WithPrice:(NSString *)price WithPriceDescription:(NSString *)priceDescription WithLink:(NSString *)link WithImageLink:(NSString *)imageUrl WithImageThumbLink: (NSString *) imageThumbnailUrl WithCompanyImageLink:(NSString *)companyImageUrl WithProductId:(NSUInteger)productId WithStatus:(Status)status {
    ManagedProduct *product = [[ManagedProduct alloc] init];
    product.name = name;
    product.productDescription = description;
    product.price = price;
    product.priceDescription = priceDescription;
    product.weblink = link;
    product.imageUrl = imageUrl;
    product.imageThumbnailUrl = imageThumbnailUrl;
    product.imageCompanyUrl = companyImageUrl;
    product.productId = productId;
    product.status = status;
    return product;
}

@end
