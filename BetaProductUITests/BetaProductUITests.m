//
//  BetaProductUITests.m
//  BetaProductUITests
//
//  Created by User on 10/17/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseView.h"
#import "ProductListView.h"
#import "ProductListDisplayItem.h"

@interface BetaProductUITests : XCTestCase
@property (nonatomic, strong) ProductListView *view;
@end

@implementation BetaProductUITests

- (void)setUp {
    [super setUp];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    self.view = [storyboard instantiateViewControllerWithIdentifier:@"ProductListView"];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    [super tearDown];
}

//- (void)testShowingNoContentMessageShowsNoContentView {
//    [self.view showNoContentMessage];
//    XCTAssertEqualObjects(self.view.view, self.view.noContentView, @"the no content view should be the view");
//}
//
//- (void)testShowingUpcomingItemsShowsTableView
//{
//    [self.view showProductList:nil];
//    XCTAssertEqualObjects(self.view.view, self.view.productTableView, @"the table view should be the view");
//}

@end
