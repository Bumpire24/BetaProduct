//
//  Product.h
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "BaseEntity.h"

@interface Product : BaseEntity

@property(nonatomic, nullable, copy) NSString *name;
@property(nonatomic, nullable, copy) NSString *weblink;
@property(nonatomic, nullable, copy) NSString *productDescription;
@property(nonatomic, nullable, copy) NSString *price;
@property(nonatomic, nullable, copy) NSString *priceDescription;
@property(nonatomic, nullable, copy) NSString *imageUrl;
@property(nonatomic, nullable, copy) NSString *imageCompanyUrl;
@property(nonatomic) UInt32 productId;

@end
