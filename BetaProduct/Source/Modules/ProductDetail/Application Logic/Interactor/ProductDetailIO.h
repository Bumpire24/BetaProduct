//
//  ProductListInteractorIO.h
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProductDetailInteractorInput <NSObject>
- (void) getProductById : (int) index;
@end

@protocol ProductDetailInteractorOutput <NSObject>
- (void) gotProductDisplayItem : (id) product;
@end
