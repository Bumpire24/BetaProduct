//
//  ProductListInteractorIO.h
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProductListInteractorInput <NSObject>
- (void) getProducts;
@end

@protocol ProductListInteractorOutput <NSObject>
- (void) gotProducts : (NSArray *) products;
@end
