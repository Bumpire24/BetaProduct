//
//  ViewController.m
//  BetaProduct
//
//  Created by User on 10/17/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "ViewController.h"
#import "RegisterDataManager.h"
#import "StoreCore.h"
#import "SyncEngine.h"
#import "ProductManager.h"
#import "ProductListInteractor.h"
#import "ProductListPresenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Scratch Pad
    StoreCore *store = [[StoreCore alloc] init];
    ProductManager *manager = [[ProductManager alloc] init];
    
    ProductListInteractor *interactor = [[ProductListInteractor alloc] init];
    ProductListPresenter *presenter = [[ProductListPresenter alloc] init];
    
    interactor.manager = manager;
    interactor.output = presenter;
    
    presenter.interactor = interactor;
    
    manager.store = store;
//    [[SyncEngine sharedManager] startInitialSync:^(bool isSuccesful, NSError *error) {
    
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
