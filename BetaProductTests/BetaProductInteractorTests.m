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

@interface BetaProductInteractorTests : XCTestCase

@property (nonatomic, strong) ProductListInteractor *interactor;
@property (nonatomic, strong) id dataManager;
@property (nonatomic, strong) id output;

@end

@implementation BetaProductInteractorTests

- (void)setUp {
    [super setUp];
    self.interactor = [[ProductListInteractor alloc] init];
    self.dataManager = [OCMockObject mockForClass:[ProductManager class]];
    self.interactor.manager = self.dataManager;
    self.output = [OCMockObject mockForProtocol:@protocol(ProductListInteractorOutput)];
    self.interactor.output = self.output;
}

- (void)tearDown {
    [self.dataManager verify];
    [self.output verify];
    [super tearDown];
}

- (void)testProductsFoundItems {
    [[self.dataManager expect] getProducts:OCMOCK_ANY];
    [self.interactor getProducts];
}

- (void)testProductsEmpty {
    NSArray *sample = @[];
    OCMStub([self.dataManager getProducts:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void(^getProducts)(BOOL isSuccessful, NSError *error, NSArray *entries) = NULL;
        [invocation getArgument:&getProducts atIndex:2];
        getProducts(true, nil, sample);
    });
    OCMExpect([self.output gotProducts:sample]);
    [self.interactor getProducts];
}

- (void)testProductsOneRecord {
    NSArray *products = @[[ManagedProduct MakeProductWithName:@"as" WithDescription:@"as" WithPrice:@"" WithPriceDescription:@"as" WithLink:@"as" WithImageLink:@"as" WithCompanyImageLink:@"as" WithProductId:0 WithStatus:1]];
    OCMStub([self.dataManager getProducts:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void(^getProducts)(BOOL isSuccessful, NSError *error, NSArray *entries) = NULL;
        [invocation getArgument:&getProducts atIndex:2];
        getProducts(true, nil, products);
    });
    [[self.output expect] gotProducts:OCMOCK_ANY];
    [self.interactor getProducts];
}

@end
