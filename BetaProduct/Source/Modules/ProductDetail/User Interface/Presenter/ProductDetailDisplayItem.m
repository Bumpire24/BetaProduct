//
//  ProductDetailDisplayItem.m
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductDetailDisplayItem.h"

@implementation ProductDetailDisplayItem

+ (instancetype) MakeProductDetailDisplayItemWithName:(NSString *)name WithWebLink:(NSString *)weblink WithProductDescription:(NSString *)description WithPrice:(NSString *)price WithPriceDescription:(NSString *)priceDescription WithImageURL:(NSString *)imageUrl WithCompanyURL:(NSString *)companyUrl {
    ProductDetailDisplayItem *item = [[ProductDetailDisplayItem alloc] init];
    item.name = name;
    item.weblink = weblink;
    item.productDescription = description;
    item.price = price;
    item.priceDescription = priceDescription;
    item.imageUrl = imageUrl;
    item.imageCompanyUrl = companyUrl;
    return item;
}

@end
