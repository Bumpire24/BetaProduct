//
//  BaseManagedEntity.h
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseTypes.h"

@interface BaseManagedEntity : NSObject

@property (nullable, nonatomic, copy) NSDate *createdAt;
@property (nullable, nonatomic, copy) NSDate *modifiedAt;
@property (nullable, nonatomic, copy) NSString *col1;
@property (nullable, nonatomic, copy) NSString *col2;
@property (nullable, nonatomic, copy) NSString *col3;
@property (nonatomic) Status status;
@property (nonatomic) SyncStatus syncStatus;

@end
