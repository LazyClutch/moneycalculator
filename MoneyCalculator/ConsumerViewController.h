//
//  ConsumerViewController.h
//  MoneyCalculator
//
//  Created by 李韧 on 15/5/4.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class ConsumerViewController;

@protocol ConsumerViewDelegate <NSObject>

- (void)consumerDidSelect:(NSArray *)consumers;
- (void)payerDidSelect:(NSArray *)payer;

@end

@interface ConsumerViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<ConsumerViewDelegate> delegate;
@property (nonatomic, assign) BOOL isConsumer;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
