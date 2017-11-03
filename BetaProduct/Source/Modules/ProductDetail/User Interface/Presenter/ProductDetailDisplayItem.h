//
//  ProductDetailDisplayItem.h
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductDetailDisplayItem : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *weblink;
@property(nonatomic, strong) NSString *productDescription;
@property(nonatomic, strong) NSString *price;
@property(nonatomic, strong) NSString *priceDescription;
@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, strong) NSString *imageCompanyUrl;

+ (instancetype) MakeProductDetailDisplayItemWithName : (NSString *) name
                                         WithWebLink : (NSString *) weblink
                              WithProductDescription : (NSString *) description
                                           WithPrice : (NSString *) price
                                WithPriceDescription : (NSString *) priceDescription
                                        WithImageURL : (NSString *) imageUrl
                                      WithCompanyURL : (NSString *) companyUrl;

@end
