//
//  ViewController.m
//  MoneyCalculator
//
//  Created by Lazy on 15/5/3.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import "ViewController.h"
#import "PersonViewController.h"
#import "BillViewController.h"
#import "TotalConsumationViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *configurations;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _configurations = @[@"人员名单",@"账单总览",@"人员花费总览"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_configurations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = _configurations[[indexPath row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([indexPath row] == 0) {
        PersonViewController *personViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonViewController"];
        personViewController.managedObjectContext = _managedObjectContext;
        [self.navigationController pushViewController:personViewController animated:YES];
    } else if ([indexPath row] == 1) {
        BillViewController *billViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BillViewController"];
        billViewController.managedObjectContext = _managedObjectContext;
        [self.navigationController pushViewController:billViewController animated:YES];
    } else if ([indexPath row] == 2){
        TotalConsumationViewController *tcVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TotalConsumationViewController"];
        tcVC.managedObjectContext = _managedObjectContext;
        [self.navigationController pushViewController:tcVC animated:YES];
    }
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
