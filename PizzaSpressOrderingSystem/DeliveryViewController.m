//
//  DeliveryViewController.m
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/27/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import "DeliveryViewController.h"

@interface DeliveryViewController ()

@property (strong, nonatomic) NSMutableArray<Order *> *orders;

@end

@implementation DeliveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.orders = [[CDManager sharedManager] getOrdersForStatus:1];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.orders.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(indexPath.row < self.orders.count) {
        Customer *customer = [[CDManager sharedManager] getCustomer:self.orders[indexPath.row].customerPhone];
        
        [cell.textLabel setNumberOfLines:5];
        
        if(customer != NULL)
            [cell.textLabel setText:[NSString stringWithFormat:@"%@\n%@\n%@", customer.name, self.orders[indexPath.row].address, customer.deliveryInstructions]];
        else [cell.textLabel setText:self.orders[indexPath.row].address];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Complete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [self.orders[indexPath.row] setFulfilled:2];
        [[CDManager sharedManager] updateOrderStatus:self.orders[indexPath.row]];
        self.orders = [[CDManager sharedManager] getOrdersForStatus:1];
        [self.tableView endUpdates];
        [self.tableView reloadData];
    }];
    
    return @[delete];
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
