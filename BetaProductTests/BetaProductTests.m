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
    
    self.dataManager = [OCMockObject mockForClass:[ProductManager class]];
    self.interactor = [[ProductListInteractor alloc] init];
    
    self.output = [OCMockObject mockForProtocol:@protocol(ProductListInteractorOutput)];
    self.interactor.output = self.output;
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [self.dataManager verify];
    [self.output verify];
    
    [super tearDown];
}

- (void)testProductsNULL {
    NSArray *sample = [NSNull null];
    id manager = OCMClassMock([ProductManager class]);
    id proto = OCMProtocolMock(@protocol(ProductListInteractorOutput));
    OCMStub([manager getProducts:([OCMArg invokeBlockWithArgs:false, false, sample, nil])]);
    OCMExpect([proto gotProducts:sample]);
    [self.interactor getProducts];
}

- (void)testProductsEmpty
{
    NSArray *sample = @[];
    id manager = OCMClassMock([ProductManager class]);
    id proto = OCMProtocolMock(@protocol(ProductListInteractorOutput));
    OCMStub([manager getProducts:([OCMArg invokeBlockWithArgs:false, false, sample, nil])]);
    OCMExpect([proto gotProducts:sample]);
    [self.interactor getProducts];
}

- (void)testProductsOneRecord
{
    NSArray *sample = @[[[ManagedProduct alloc] init]];
    NSArray *another = @[[[ProductListDisplayItem alloc] init]];
    id manager = OCMClassMock([ProductManager class]);
    id proto = OCMProtocolMock(@protocol(ProductListInteractorOutput));
    OCMStub([manager getProducts:([OCMArg invokeBlockWithArgs:false, false, sample, nil])]);
    OCMExpect([proto gotProducts:another]);
    [self.interactor getProducts];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        [self.interactor.manager getProducts:^(BOOL isSuccessful, NSError *error, NSArray *entries) {
            ;
        }];
        // Put the code you want to measure the time of here.
    }];
}

@end
