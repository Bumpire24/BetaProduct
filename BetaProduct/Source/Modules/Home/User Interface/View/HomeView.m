//
//  HomeView.m
//  BetaProduct
//
//  Created by User on 10/30/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "HomeView.h"

@interface HomeView ()

@end

@implementation HomeView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController *view1 = [[UIViewController alloc] init];
    UIViewController *view2 = [[UIViewController alloc] init];
    UIViewController *view3 = [[UIViewController alloc] init];
    UIViewController *view4 = [[UIViewController alloc] init];
    
    view1.view.backgroundColor = [UIColor redColor];
    view2.view.backgroundColor = [UIColor blueColor];
    view3.view.backgroundColor = [UIColor greenColor];
    view4.view.backgroundColor = [UIColor blackColor];
    
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:view1];
    [tabViewControllers addObject:view2];
    [tabViewControllers addObject:view3];
    [tabViewControllers addObject:view4];
    
    [self setViewControllers:tabViewControllers];
    //can't set this until after its added to the tab bar
    view1.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"QR Code Scanner"
                                  image:[UIImage imageNamed:@"qr"]
                                    tag:1];
    view2.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Products"
                                  image:[UIImage imageNamed:@"products"]
                                    tag:2];
    view3.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Shop Cart"
                                  image:[UIImage imageNamed:@"shopcart"]
                                    tag:3];
    view4.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Settings"
                                  image:[UIImage imageNamed:@"settings"]
                                    tag:4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
