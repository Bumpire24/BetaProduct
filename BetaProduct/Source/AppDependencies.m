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
#import "StoreCore.h"
#import "RootWireFrame.h"
#import "ProductManager.h"
#import "ProductListInteractor.h"
#import "ProductListPresenter.h"
#import "ProductListWireFrame.h"
#import "ProductDetailInteractor.h"
#import "ProductDetailPresenter.h"
#import "ProductDetailWireframe.h"
#import "HomeWireframe.h"

@interface AppDependencies()
@property (nonatomic, strong) HomeWireframe *homeWireframe;
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
    
}

- (void) configureLibraries {
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    
    [DDLog addLogger:fileLogger];
    
    DDLogInfo(@"Test Logs");
    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
    
    #ifdef DEV
        DDLogInfo(@"Development Environment");
    #elif QA
        DDLogInfo(@"QA Environment");
    #elif PROD
        DDLogInfo(@"QA Environment");
    #endif
    
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
    
    //Product Detail Module Classes
    ProductDetailInteractor *detailInteractor = [[ProductDetailInteractor alloc] init];
    ProductDetailPresenter *detailPresenter = [[ProductDetailPresenter alloc] init];
    ProductDetailWireframe *detailWireframe = [[ProductDetailWireframe alloc] init];
    
    detailInteractor.manager = listDataManager;
    detailInteractor.output = detailPresenter;
    
    detailPresenter.interactor = detailInteractor;
    detailPresenter.detailwireframe = detailWireframe;
    
    detailWireframe.presenter = detailPresenter;
    
    listWireframe.detailWireframe = detailWireframe;
    
    // Home Module Classes
    HomeWireframe *homeWireframe = [[HomeWireframe alloc] init];
    homeWireframe.productListWireFrame = listWireframe;
    homeWireframe.rootWireFrame = rootWireframe;
    self.homeWireframe = homeWireframe;
}

- (void) installRootViewControllerInWindow:(UIWindow *)window {
    [self.homeWireframe presentHomeViewInterfaceFromWindow:window];
}

@end
