//
//  PersonBillsViewController.h
//  MoneyCalculator
//
//  Created by 李韧 on 15/5/6.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Person.h"

@interface PersonBillsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


@end
