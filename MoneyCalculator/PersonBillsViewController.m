//
//  PersonBillsViewController.m
//  MoneyCalculator
//
//  Created by 李韧 on 15/5/6.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import "PersonBillsViewController.h"
#import "Bill.h"
#import "BillDisplayViewController.h"

@interface PersonBillsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *totalPayLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalConsumeLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *controlSeg;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) NSArray *payedBills;
@property (nonatomic, strong) NSArray *consumedBills;

@end

@implementation PersonBillsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_controlSeg addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    _controlSeg.selectedSegmentIndex = 0;
    
    _payedBills = [[NSArray alloc] init];
    _consumedBills = [[NSArray alloc] init];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _titleLabel.text = _person.name;
    _totalPayLabel.text = [NSString stringWithFormat:@"总花费:%@",_person.totalPay];
    _totalConsumeLabel.text = [NSString stringWithFormat:@"总消费:%@",_person.totalConsume];
    [self loadBills];
}

- (void)loadBills{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Bill"];
    request.predicate = [NSPredicate predicateWithFormat:@"personsIncluded CONTAINS %@",_person];
    NSError *error;
    NSArray *result = [_managedObjectContext executeFetchRequest:request error:&error];
    if (!error && [result count] != 0) {
        _consumedBills = result;
    }
    
    request.predicate = [NSPredicate predicateWithFormat:@"payer CONTAINS %@",_person];
    result = [_managedObjectContext executeFetchRequest:request error:&error];
    if (!error && [result count] != 0) {
        _payedBills = result;
    }
    
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)return:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UISegmentControl

- (void)segmentChanged:(UISegmentedControl *)segmentControl{
    [_tableView reloadData];
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_controlSeg.selectedSegmentIndex == 0) {
        return [_payedBills count];
    }
    return [_consumedBills count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Bill *bill = nil;
    if (_controlSeg.selectedSegmentIndex == 0) {
        bill = [_payedBills objectAtIndex:[indexPath row]];
    } else {
        bill = [_consumedBills objectAtIndex:[indexPath row]];
    }
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentDateStr = [dateFormat stringFromDate:bill.date];
    cell.textLabel.text = bill.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"时间:%@ 总额:%@",currentDateStr,bill.price];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BillDisplayViewController *displayViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BillDisplayViewController"];
    if (_controlSeg.selectedSegmentIndex == 0) {
        displayViewController.bill = _payedBills[indexPath.row];
    } else {
        displayViewController.bill = _consumedBills[indexPath.row];
    }
    
    [self presentViewController:displayViewController animated:YES completion:nil];
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
