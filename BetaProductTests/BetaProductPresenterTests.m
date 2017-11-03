//
//  BetaProductPresenterTests.m
//  BetaProductTests
//
//  Created by User on 11/3/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ProductListPresenter.h"
#import "ProductListViewProtocol.h"
#import "ProductListWireFrame.h"
#import "ProductListDisplayItem.h"

@interface BetaProductPresenterTests : XCTestCase
@property (nonatomic, strong)   ProductListPresenter *presenter;
@property (nonatomic, strong)   id                    view;
@property (nonatomic, strong)   id                    wireframe;
@end

@implementation BetaProductPresenterTests

- (void)setUp {
    [super setUp];
    self.presenter = [[ProductListPresenter alloc] init];
    self.view = [OCMockObject mockForProtocol:@protocol(ProductListViewProtocol)];
    self.wireframe = [OCMockObject mockForClass:[ProductListWireFrame class]];

    self.presenter.view = self.view;
    self.presenter.productListWireFrame = self.wireframe;
}

- (void)tearDown {
    [self.view verify];
    [self.wireframe verify];
    [super tearDown];
}

- (void) testFoundNoResultsAndShouldDisplayNoContentMessage {
    [[self.view expect] showNoContentMessage];
    [self.presenter gotProducts:@[]];
}

- (void) testFoundResultsAndShouldDisplayProducts {
    [[self.view expect] showProductList:OCMOCK_ANY];
    [self.presenter gotProducts:@[[ProductListDisplayItem MakeProductListItemWithName:@""
                                                                           WithDetail:@""
                                                                              WithURL:[NSURL URLWithString:@""]]]];
}

@end
