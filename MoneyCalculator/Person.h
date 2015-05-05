//
//  Person.h
//  MoneyCalculator
//
//  Created by Lazy on 15/5/5.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bill;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * totalPay;
@property (nonatomic, retain) NSNumber * totalConsume;
@property (nonatomic, retain) NSSet *bills;
@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addBillsObject:(Bill *)value;
- (void)removeBillsObject:(Bill *)value;
- (void)addBills:(NSSet *)values;
- (void)removeBills:(NSSet *)values;

@end
