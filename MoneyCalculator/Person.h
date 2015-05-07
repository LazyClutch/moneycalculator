//
//  Person.h
//  MoneyCalculator
//
//  Created by Lazy on 15/5/7.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bill;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * totalConsume;
@property (nonatomic, retain) NSNumber * totalPay;
@property (nonatomic, retain) NSSet *payedBills;
@property (nonatomic, retain) NSSet *consumedBills;
@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addPayedBillsObject:(Bill *)value;
- (void)removePayedBillsObject:(Bill *)value;
- (void)addPayedBills:(NSSet *)values;
- (void)removePayedBills:(NSSet *)values;

- (void)addConsumedBillsObject:(Bill *)value;
- (void)removeConsumedBillsObject:(Bill *)value;
- (void)addConsumedBills:(NSSet *)values;
- (void)removeConsumedBills:(NSSet *)values;

@end
