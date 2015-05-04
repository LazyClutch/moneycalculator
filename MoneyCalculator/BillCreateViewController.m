//
//  BillCreateViewController.m
//  MoneyCalculator
//
//  Created by 李韧 on 15/5/4.
//  Copyright (c) 2015年 Lazy. All rights reserved.
//

#import "BillCreateViewController.h"
#import "Person.h"

@interface BillCreateViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *location;
@property (weak, nonatomic) IBOutlet UITextField *price;
@property (weak, nonatomic) IBOutlet UITextField *content;
@property (weak, nonatomic) IBOutlet UILabel *personsLabel;
@property (weak, nonatomic) IBOutlet UILabel *payerLabel;

@property (nonatomic, strong) ConsumerViewController *consumerViewController;

@property (nonatomic, strong) NSArray *selectedConsumers;
@property (nonatomic, strong) NSArray *selectedPayers;

@end

@implementation BillCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _consumerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConsumerViewController"];
    _consumerViewController.delegate = self;
    _consumerViewController.managedObjectContext = _managedObjectContext;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)choosePersons:(id)sender {
    _consumerViewController.isConsumer = YES;
    [self presentViewController:_consumerViewController animated:YES completion:nil];
}

- (IBAction)choosePayers:(id)sender {
    _consumerViewController.isConsumer = NO;
    [self presentViewController:_consumerViewController animated:YES completion:nil];
}

- (IBAction)return:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ConsumerViewDelegate
- (void)consumerDidSelect:(NSArray *)consumers{
    _selectedConsumers = consumers;
    __block NSString *persons = [[NSString alloc] init];
    [consumers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *name = [(Person *)obj name];
        persons = [persons stringByAppendingString:name];
        persons = [persons stringByAppendingString:@" "];
    }];
    _personsLabel.text = persons;
}

- (void)payerDidSelect:(NSArray *)payer{
    _selectedPayers = payer;
    __block NSString *persons = [[NSString alloc] init];
    [payer enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        persons = [persons stringByAppendingString:[(Person *)obj name]];
        persons = [persons stringByAppendingString:@" "];
    }];
    _payerLabel.text = persons;
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
