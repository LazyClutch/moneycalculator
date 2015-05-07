//
//  Bill.h
//  MoneyCalculator
//
//  Created by Lazy on 15/5/7.
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
@property (nonatomic, retain) NSSet *payer;
@property (nonatomic, retain) NSSet *personsIncluded;
@end

@interface Bill (CoreDataGeneratedAccessors)

- (void)addPayerObject:(Person *)value;
- (void)removePayerObject:(Person *)value;
- (void)addPayer:(NSSet *)values;
- (void)removePayer:(NSSet *)values;

- (void)addPersonsIncludedObject:(Person *)value;
- (void)removePersonsIncludedObject:(Person *)value;
- (void)addPersonsIncluded:(NSSet *)values;
- (void)removePersonsIncluded:(NSSet *)values;

@end
