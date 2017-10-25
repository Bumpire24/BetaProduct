//
//  ProductListView.m
//  BetaProduct
//
//  Created by User on 10/25/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ProductListView.h"
#import "ManagedProduct.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ProductListView ()
@property (nonatomic, strong) NSArray *products;
@end

@implementation ProductListView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
    // Do any additional setup after loading the view.
}

- (void) configureView {
    self.products = [[NSArray alloc] init];
    self.productTableView.delegate = self;
    self.productTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.eventHandler updateView];
}

- (void)showNoContentMessage {
    NSLog(@"NO CONTENT");
    self.view = self.noContentView;
}

- (void)showProductList:(NSArray *)products {
    self.products = products;
    [self.productTableView reloadData];
    self.view = self.productTableView;
    NSLog(@"SHOW PRODS");
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    ManagedProduct *product = self.products[indexPath.row];
    __weak UITableViewCell *weakCell = cell;
    cell.textLabel.text = product.name;
    cell.detailTextLabel.text = product.imageUrl;
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.png"];
//    UIImageView *imageview = [[UIImageView alloc] init];
    [cell.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:product.imageUrl]] placeholderImage:placeholderImage success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        weakCell.imageView.image = image;
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        ;
    }];
//    cell.imageView;
    return cell;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.products count];
}

@end
