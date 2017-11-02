//
//  HomeWireframe.m
//  BetaProduct
//
//  Created by User on 11/2/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "HomeWireframe.h"
#import "HomeView.h"
#import "HomePresenter.h"
#import "RootWireFrame.h"
#import "ProductListWireFrame.h"
#import "ProductListView.h"

static NSString *homeViewIdentifier = @"HomeView";

@interface HomeWireframe()
@property (nonatomic, strong) HomeView *homeView;
@end

@implementation HomeWireframe

#pragma mark - Public
- (void)presentHomeViewInterfaceFromWindow:(UIWindow *)window {
    self.homeView = [[self mainStoryboard] instantiateViewControllerWithIdentifier:homeViewIdentifier];
    [self assembleViewControllersForHomeView];
    [self.rootWireFrame showRootViewController:self.homeView inWindow:window];
}

#pragma mark - Private
- (void) assembleViewControllersForHomeView {
    UIViewController *qrView = [[UIViewController alloc] init];
    ProductListView *productListView = [self.productListWireFrame productListInterfaceForHomeRegistry];
    UIViewController *shopCartView = [[UIViewController alloc] init];
    UIViewController *settingsView = [[UIViewController alloc] init];
    
    qrView.view.backgroundColor = [UIColor redColor];
    productListView.view.backgroundColor = [UIColor yellowColor];
    shopCartView.view.backgroundColor = [UIColor blueColor];
    settingsView.view.backgroundColor = [UIColor greenColor];
    
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:qrView];
    [tabViewControllers addObject:productListView];
    [tabViewControllers addObject:shopCartView];
    [tabViewControllers addObject:settingsView];
    
    [self.homeView setViewControllers:tabViewControllers];
    
    qrView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"QR Code Scanner" image:[UIImage imageNamed:@"qr"] tag:1];
//    productListView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Products" image:[UIImage imageNamed:@"products"] tag:2];
    shopCartView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Shop Cart" image:[UIImage imageNamed:@"shopcart"] tag:3];
    settingsView.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Settings" image:[UIImage imageNamed:@"settings"] tag:4];
    
    [self.homeView setSelectedViewController:productListView];
}

@end
