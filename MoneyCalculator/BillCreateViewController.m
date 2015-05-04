//
//  BillCreateViewController.m
//  MoneyCalculator
//
//  Created by 李韧 on 15/5/4.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import "BillCreateViewController.h"

@interface BillCreateViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *location;
@property (weak, nonatomic) IBOutlet UITextField *price;
@property (weak, nonatomic) IBOutlet UITextField *content;
@property (weak, nonatomic) IBOutlet UILabel *personsLabel;
@property (weak, nonatomic) IBOutlet UILabel *payerLabel;

@end

@implementation BillCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)choosePersons:(id)sender {
    
}

- (IBAction)choosePayers:(id)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
