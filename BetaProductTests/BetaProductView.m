//
//  BetaProductView.m
//  BetaProductTests
//
//  Created by User on 10/27/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ProductListView.h"

@interface BetaProductView : XCTestCase
@property (nonatomic, strong) ProductListView *view;
@end

@implementation BetaProductView

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.view = [storyboard instantiateViewControllerWithIdentifier:@"ProductListView"];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testShowingNoContentMessageShowsNoContentView {
    [self.view showNoContentMessage];
    XCTAssertEqualObjects(self.view.view, self.view.noContentView, @"the no content view should be the view");
}

- (void)testShowingUpcomingItemsShowsTableView {
    [self.view showProductList:nil];
    XCTAssertEqualObjects(self.view.view, self.view.productTableView, @"the table view should be the view");
}

@end
