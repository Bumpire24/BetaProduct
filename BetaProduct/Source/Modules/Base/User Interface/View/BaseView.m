//
//  BaseView.m
//  BetaProduct
//
//  Created by User on 10/27/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "BaseView.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface BaseView ()
@property (nonatomic, strong) MBProgressHUD *hud;
@end

@implementation BaseView

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    [self configureLayout];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private
- (void) setUpProgressLoader {
    self.hud = [[MBProgressHUD alloc] initWithView:self.view];
    self.hud.animationType = MBProgressHUDAnimationFade;
    self.hud.label.text = @"Loading Data";
    [self.view addSubview:self.hud];
//    self.hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
}
                
#pragma mark - Public
- (void) configureView {
    [self setUpProgressLoader];
}

- (void) configureLayout {
    
}

- (void) showProgressLoad {
    [self.hud showAnimated:YES];
}

- (void) hideProgressLoad {
    [self.hud hideAnimated:YES];
}

- (void) hideProgressLoadWithComplete {
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    self.hud.customView = imageView;
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.label.text = @"Completed";
    [self.hud hideAnimated:YES afterDelay:1.f];
//    [self.hud hideAnimated:YES];
}

@end
