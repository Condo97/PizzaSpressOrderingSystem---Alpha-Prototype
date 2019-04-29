//
//  RegisterViewController.m
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/27/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (strong, nonatomic) Order *theOrder;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.theOrder = [[Order alloc] init];
    [self.theOrder setItems:@""];
    // Do any additional setup after loading the view.
}

- (IBAction)scheduleForLaterDate:(id)sender {
    [self.scheduleDate setEnabled:((UISwitch *)sender).on];
}

- (IBAction)margharita:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@Cheese Pizza$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)pineapple:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@Gluten Free Pizza$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)sausage:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@Flatbread$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)pepperoni:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@Calzone$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)addMeatballs:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@  + Meatballs$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)addBacon:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@  + Bacon$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)addMushrooms:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@  + Mushrooms$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)addPeppers:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@  + Peppers$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)addPineapple:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@  + Pineapple$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)addSausage:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@  + Sausage$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)addPepperoni:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@  + Pepperoni$", self.theOrder.items]];
    
    [self.tableView reloadData];
}
- (IBAction)addSpinach:(id)sender {
    [self.theOrder setItems:[NSString stringWithFormat:@"%@  + Spinach$", self.theOrder.items]];
    
    [self.tableView reloadData];
}

- (IBAction)submit:(id)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
    
    int orderID = arc4random_uniform(99999);
    
    Order *order = [[Order alloc] initWithPhone:self.phone.text
                                        address:[NSString stringWithFormat:@"%@\n%@", self.address1.text, self.address2.text]
                                     creditCard:self.creditCard.text items:self.theOrder.items
                                           date:[formatter stringFromDate:[NSDate date]]
                                  scheduledDate:self.scheduleDate.text
                                        orderID:orderID
                                      fulfilled:0];
    [[CDManager sharedManager] saveOrder:order];
    
    [self.theOrder setItems:@""];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.theOrder.items componentsSeparatedByString:@"$"].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *separatedItems = [self.theOrder.items componentsSeparatedByString:@"$"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(indexPath.row < separatedItems.count) {
        [cell.textLabel setText:separatedItems[indexPath.row]];
    }
    
    return cell;
}

- (IBAction)createCustomer:(id)sender {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Enter Name" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [ac addTextFieldWithConfigurationHandler:^(UITextField *tf) {
        [tf setPlaceholder:@"Name"];
    }];
    [ac addTextFieldWithConfigurationHandler:^(UITextField *tf) {
        [tf setPlaceholder:@"Delivery Instructions"];
    }];
    [ac addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [ac addAction:[UIAlertAction actionWithTitle:@"Submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        Customer *customer = [[Customer alloc] initWithPhone:self.phone.text
                                               streetAddress:[NSString stringWithFormat:@"%@\n%@", self.address1.text, self.address2.text]
                                        deliveryInstructions:ac.textFields[1].text
                                                  creditCard:self.creditCard.text
                                                        name:ac.textFields[0].text];
        
        [[CDManager sharedManager] saveCustomer:customer];
    }]];
    
    [self presentViewController:ac animated:YES completion:nil];
}

- (IBAction)autofill:(id)sender {
    Customer *customer = [[CDManager sharedManager] getCustomer:self.phone.text];
    if(customer != NULL) {
        if([customer.streetAddress containsString:@"\n"]) {
            [self.address1 setText:[customer.streetAddress componentsSeparatedByString:@"\n"][0]];
            [self.address2 setText:[customer.streetAddress componentsSeparatedByString:@"\n"][1]];
        } else [self.address1 setText:customer.streetAddress];
        
        [self.creditCard setText:customer.creditCard];
    }
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
