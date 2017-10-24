//
//  BaseEntity.h
//  BetaProduct
//
//  Created by User on 10/24/17.
//  Copyright © 2017 User. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "DatabaseTypes.h"

@interface BaseEntity : NSManagedObject

@property (nullable, nonatomic, copy) NSDate *createdAt;
@property (nullable, nonatomic, copy) NSDate *modifiedAt;
@property (nullable, nonatomic, copy) NSString *col1;
@property (nullable, nonatomic, copy) NSString *col2;
@property (nullable, nonatomic, copy) NSString *col3;
@property (nonatomic) Status status;
@property (nonatomic) SyncStatus syncStatus;

@end
