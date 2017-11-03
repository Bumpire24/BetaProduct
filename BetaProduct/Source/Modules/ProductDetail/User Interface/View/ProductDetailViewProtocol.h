//
//  ProductDetailViewProtocol.h
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductDetailDisplayItem.h"

@protocol ProductDetailViewProtocol <NSObject>
- (void) setSelectedProductIndex : (NSInteger) index;
- (void) displayViewWithProductItem : (ProductDetailDisplayItem *) product;
@end
