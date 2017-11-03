//
//  ProductDetailVIew.m
//  BetaProduct
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductDetailView.h"

@interface ProductDetailView ()
@property (nonatomic) NSInteger selectedIndex;
@end

@implementation ProductDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.eventHandler presentProductDetailWithIndex:self.selectedIndex];
}

- (void) setSelectedProductIndex : (NSInteger) index {
    self.selectedIndex = index;
}

- (void) displayViewWithProductItem : (ProductDetailDisplayItem *) product {
    self.view.backgroundColor = [UIColor redColor];
}

@end
