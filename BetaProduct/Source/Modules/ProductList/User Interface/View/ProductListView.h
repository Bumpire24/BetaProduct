//
//  ProductListView.h
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductListViewProtocol.h"
#import "ProductListModuleProtocol.h"
#import "BaseView.h"

@interface ProductListView : BaseView <ProductListViewProtocol, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UIView* noContentView;
@property (nonatomic, strong) IBOutlet UITableView* productTableView;
@property (nonatomic, strong) id<ProductListModuleProtocol> eventHandler;

@end
