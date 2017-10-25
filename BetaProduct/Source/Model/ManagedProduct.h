//
//  ManagedProduct.h
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "DatabaseTypes.h"
#import "BaseManagedEntity.h"

@interface ManagedProduct : BaseManagedEntity

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *weblink;
@property(nonatomic, copy) NSString *productDescription;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *priceDescription;
@property(nonatomic, copy) NSString *imageUrl;
@property(nonatomic, copy) NSString *imageCompanyUrl;
@property(nonatomic) NSUInteger productId;

+ (instancetype) MakeProductWithName: (NSString *) name
                     WithDescription: (NSString *) description
                           WithPrice: (NSString *) price
                WithPriceDescription: (NSString *) priceDescription
                            WithLink: (NSString *) link
                       WithImageLink: (NSString *) imageUrl
                WithCompanyImageLink: (NSString *) companyImageUrl
                       WithProductId: (NSUInteger) productId;

+ (instancetype) MakeProductWithName: (NSString *) name
                     WithDescription: (NSString *) description
                           WithPrice: (NSString *) price
                WithPriceDescription: (NSString *) priceDescription
                            WithLink: (NSString *) link
                       WithImageLink: (NSString *) imageUrl
                WithCompanyImageLink: (NSString *) companyImageUrl
                       WithProductId: (NSUInteger) productId
                          WithStatus: (Status) status;

@end
