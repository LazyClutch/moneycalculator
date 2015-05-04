//
//  Bill.h
//  MoneyCalculator
//
//  Created by 李韧 on 15/5/4.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Bill : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSSet *personsIncluded;
@property (nonatomic, retain) NSSet *payer;
@end

@interface Bill (CoreDataGeneratedAccessors)

- (void)addPersonsIncludedObject:(Person *)value;
- (void)removePersonsIncludedObject:(Person *)value;
- (void)addPersonsIncluded:(NSSet *)values;
- (void)removePersonsIncluded:(NSSet *)values;

- (void)addPayerObject:(Person *)value;
- (void)removePayerObject:(Person *)value;
- (void)addPayer:(NSSet *)values;
- (void)removePayer:(NSSet *)values;

@end
