//
//  AppDependencies.m
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import "AppDependencies.h"
#import "StoreWebClient.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import "SyncEngine.h"
#import <MBProgressHUD/MBProgressHUD.h>

#import "StoreCore.h"
#import "RootWireFrame.h"
#import "ProductManager.h"
#import "ProductListInteractor.h"
#import "ProductListPresenter.h"
#import "ProductListWireFrame.h"

@interface AppDependencies()
@property (nonatomic, strong) ProductListWireFrame *productListWireframe;
@end

@implementation AppDependencies

- (id) init {
    self = [super init];
    if (self) {
        [self configureApp];
        [self configureLibraries];
        [self configureDependencies];
    }
    return self;
}

- (void) configureApp {
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void) configureLibraries {
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    
    [DDLog addLogger:fileLogger];
    
    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [AFNetworkActivityIndicatorManager sharedManager].activationDelay = 0;
}

- (void) configureDependencies {
    // Root Level Classes
    StoreCore *store = [[StoreCore alloc] init];
    RootWireFrame *rootWireframe = [[RootWireFrame alloc] init];
    
    // Product List Modules Classes
    ProductListWireFrame *listWireframe = [[ProductListWireFrame alloc] init];
    ProductListPresenter *listPresenter = [[ProductListPresenter alloc] init];
    ProductManager *listDataManager = [[ProductManager alloc] init];
    ProductListInteractor *listInteractor = [[ProductListInteractor alloc] init];
    
    listDataManager.store = store;
    listInteractor.manager = listDataManager;
    listInteractor.output = listPresenter;
    
    listPresenter.interactor = listInteractor;
    listPresenter.productListWireFrame = listWireframe;
    
    listWireframe.listPresenter = listPresenter;
    listWireframe.rootWireframe = rootWireframe;
    self.productListWireframe = listWireframe;
}

- (void) installRootViewControllerInWindow:(UIWindow *)window {
    [self.productListWireframe presentProductListInterfaceFromWindow:window];
}

@end
