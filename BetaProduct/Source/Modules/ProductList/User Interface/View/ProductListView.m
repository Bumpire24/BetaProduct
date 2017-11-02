//
//  ProductListView.m
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductListView.h"
#import "ProductListDisplayItem.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ProductListView ()
@property (nonatomic, strong) NSArray *products;
@end

@implementation ProductListView
static NSString *kProductListCell = @"productListCell";

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self showProgressLoad];
    [self.eventHandler updateView];
}

#pragma mark - Private
- (void) reloadEntries {
    
}

#pragma mark - BaseView
- (void) configureView {
    [super configureView];
    self.products = [[NSArray alloc] init];
}

- (void) configureLayout {
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Products" image:[UIImage imageNamed:@"products"] tag:2];
    self.view = self.noContentView;
    [super configureLayout];
}

#pragma mark - ProductListViewProtocol
- (void)showNoContentMessage {
    self.view = self.noContentView;
    [self hideProgressLoadWithComplete];
}

- (void)showProductList:(NSArray *)products {
    self.products = products;
    [self.productTableView reloadData];
    self.view = self.productTableView;
    [self hideProgressLoadWithComplete];
}

#pragma mark - TableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // TODO: Add Caching on images?
    // TODO: Handle error?
    ProductListDisplayItem *item = self.products[indexPath.row];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kProductListCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kProductListCell];
    }
    __weak UITableViewCell *weakCell = cell;
    cell.textLabel.text = item.productName;
    cell.detailTextLabel.text = item.productDetail;
    [cell.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:item.productImageURL]
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        weakCell.imageView.image = image;
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        
    }];
    return cell;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.products count];
}

@end
