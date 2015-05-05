//
//  TotalConsumationViewController.h
//  MoneyCalculator
//
//  Created by Lazy on 15/5/5.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TotalConsumationViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
