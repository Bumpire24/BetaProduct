//
//  BetaProductTests.m
//  BetaProductTests
//
//  Created by User on 10/17/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseManager.h"
#import "ProductManager.h"
#import "ProductListInteractor.h"
#import "CompletionBlockTypes.h"
#import "ManagedProduct.h"
#import "ProductListDisplayItem.h"
#import "ProductListInteractorIO.h"
#import <OCMock/OCMock.h>

@interface BetaProductTests : XCTestCase

@property (nonatomic, strong) ProductListInteractor *interactor;
@property (nonatomic, strong) id dataManager;
@property (nonatomic, strong) id output;

@end

@implementation BetaProductTests

- (void)setUp {
    [super setUp];
    self.dataManager = OCMClassMock([ProductManager class]);
    self.interactor = [[ProductListInteractor alloc] init];
    self.output = OCMProtocolMock(@protocol(ProductListInteractorOutput));
    self.interactor.output = self.output;
}

- (void)tearDown {
    OCMVerify(self.dataManager);
    OCMVerify(self.output);
    [super tearDown];
}

- (void)testProductsFoundItems {
    OCMExpect([self.dataManager getProducts:([OCMArg invokeBlockWithArgs:false, OCMOCK_ANY, OCMOCK_ANY, nil])]);
    [self.interactor getProducts];
}

- (void)testProductsEmpty {
    NSArray *sample = @[];
    OCMStub([self.dataManager getProducts:([OCMArg invokeBlockWithArgs:false, OCMOCK_ANY, sample, nil])]);
    OCMExpect([self.output gotProducts:sample]);
    [self.interactor getProducts];
}

- (void)testProductsOneRecord {
    NSArray *sample = @[[[ManagedProduct alloc] init]];
    NSArray *another = @[[[ProductListDisplayItem alloc] init]];
    OCMStub([self.dataManager getProducts:([OCMArg invokeBlockWithArgs:false, OCMOCK_ANY, sample, nil])]);
    OCMExpect([self.output gotProducts:another]);
    [self.interactor getProducts];
}

@end
