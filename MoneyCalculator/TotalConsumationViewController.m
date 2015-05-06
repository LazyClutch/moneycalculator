//
//  TotalConsumationViewController.m
//  MoneyCalculator
//
//  Created by Lazy on 15/5/5.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import "TotalConsumationViewController.h"
#import "PersonBillsViewController.h"
#import "Person.h"

@interface TotalConsumationViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *persons;

@end

@implementation TotalConsumationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _persons = [[NSMutableArray alloc] init];
    
    [self initView];
    [self loadPerson];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    self.navigationItem.title = @"人员花费总览";
}

- (void)loadPerson{
    if (_managedObjectContext != nil) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
        NSError *error;
        NSArray *array = [_managedObjectContext executeFetchRequest:request error:&error];
        if (!error) {
            _persons = [array mutableCopy];
        }
        [_tableView reloadData];
    }
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_persons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    Person *person = [_persons objectAtIndex:[indexPath row]];
    cell.textLabel.text = [person name];
    NSNumber *pay = person.totalPay;
    NSNumber *consume = person.totalConsume;
    CGFloat delta = [consume floatValue] - [pay floatValue];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"实花:%0.2f 应花:%0.2f 应付:%0.2f",[person.totalPay floatValue],[person.totalConsume floatValue],delta];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PersonBillsViewController *personBillVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonBillsViewController"];
    personBillVC.managedObjectContext = _managedObjectContext;
    personBillVC.person = [_persons objectAtIndex:[indexPath row]];
    [self presentViewController:personBillVC animated:YES completion:nil];
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
