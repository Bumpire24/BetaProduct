//
//  ProductListDisplayItem.m
//  BetaProduct
//
//  Created by User on 10/26/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductListDisplayItem.h"

@implementation ProductListDisplayItem

+ (instancetype) MakeProductListItemWithName:(NSString *)name WithDetail:(NSString *)detail WithURL:(NSURL *)url {
    ProductListDisplayItem *item = [[ProductListDisplayItem alloc] init];
    item.productName = name;
    item.productDetail = detail;
    item.productImageURL = url;
    return item;
}

@end
