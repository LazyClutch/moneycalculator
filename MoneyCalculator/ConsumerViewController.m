//
//  ConsumerViewController.m
//  MoneyCalculator
//
//  Created by 李韧 on 15/5/4.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import "ConsumerViewController.h"

@interface ConsumerViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *persons;
@property (nonatomic, strong) NSMutableArray *selectedRows;
@property (nonatomic, strong) NSMutableArray *selectedPersons;

@end

@implementation ConsumerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _selectedRows = [[NSMutableArray alloc] init];
    _selectedPersons = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
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

- (IBAction)return:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)personConfirm:(id)sender {
    if (_isConsumer) {
        // handle consumer select
        [self.delegate consumerDidSelect:[_selectedPersons copy]];
    } else {
        // handle payer select
        [self.delegate payerDidSelect:[_selectedPersons copy]];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if ([_selectedRows containsObject:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = [[_persons objectAtIndex:[indexPath row]] name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.selectedRows containsObject:indexPath])
    {
        [self.selectedRows removeObject:indexPath];
        [self.selectedPersons removeObject:_persons[indexPath.row]];
    }
    else
    {
        [self.selectedRows addObject:indexPath];
        [self.selectedPersons addObject:_persons[indexPath.row]];
    }
    
    [_tableView reloadData];
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
