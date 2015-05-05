//
//  BillCreateViewController.h
//  MoneyCalculator
//
//  Created by 李韧 on 15/5/4.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ConsumerViewController.h"

@interface BillCreateViewController : UIViewController<ConsumerViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


@end
