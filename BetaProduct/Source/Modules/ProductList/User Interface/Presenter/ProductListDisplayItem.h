//
//  ProductListDisplayItem.h
//  BetaProduct
//
//  Created by User on 10/26/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductListDisplayItem : NSObject

@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) NSString *productDetail;
@property (nonatomic, strong) NSURL *productImageURL;

+ (instancetype) MakeProductListItemWithName : (NSString *) name
                                  WithDetail : (NSString *) detail
                                     WithURL : (NSURL *) url;

@end
