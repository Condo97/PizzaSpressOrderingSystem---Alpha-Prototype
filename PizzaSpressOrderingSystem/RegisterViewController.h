//
//  RegisterViewController.h
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/27/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"
#import "Customer.h"
#import "CDManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *address1;
@property (weak, nonatomic) IBOutlet UITextField *address2;
@property (weak, nonatomic) IBOutlet UITextField *creditCard;
@property (weak, nonatomic) IBOutlet UITextField *scheduleDate;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
