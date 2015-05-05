//
//  BillDisplayViewController.m
//  MoneyCalculator
//
//  Created by 李韧 on 15/5/4.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import "BillDisplayViewController.h"
#import "Person.h"

@interface BillDisplayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *personsLabel;
@property (weak, nonatomic) IBOutlet UILabel *payerLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation BillDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentDateStr = [dateFormat stringFromDate:_bill.date];
    _dateLabel.text = currentDateStr;
    _locationLabel.text = _bill.location;
    __block NSString *persons = [[NSString alloc] init];
    [_bill.personsIncluded enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        NSString *name = [(Person *)obj name];
        persons = [persons stringByAppendingString:name];
        persons = [persons stringByAppendingString:@" "];
    }];
    _personsLabel.text = persons;
    __block NSString *payer = [[NSString alloc] init];
    [_bill.payer enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        NSString *name = [(Person *)obj name];
        payer = [payer stringByAppendingString:name];
        payer = [payer stringByAppendingString:@" "];
    }];
    _payerLabel.text = payer;
    _priceLabel.text = [_bill.price description];
    _contentLabel.text = _bill.content;
}

- (void)setBill:(Bill *)bill{
    _bill = bill;
}

- (IBAction)return:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
