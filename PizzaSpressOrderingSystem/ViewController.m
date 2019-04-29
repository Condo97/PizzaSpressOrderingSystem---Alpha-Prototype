//
//  ViewController.m
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/26/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    
}

- (IBAction)loginButton:(id)sender {
    Staff *staff = [[CDManager sharedManager] getStaff:self.loginUsername.text pass:self.loginPassword.text];
    if(staff != NULL) {
        if(staff.role == 0) [self performSegueWithIdentifier:@"toRegister" sender:nil];
        else if(staff.role == 1) [self performSegueWithIdentifier:@"toKitchen" sender:nil];
        else [self performSegueWithIdentifier:@"toDelivery" sender:nil];
    }
}

- (IBAction)positionSelector:(id)sender {
}

- (IBAction)signUpButton:(id)sender {
    Staff *staff = [[Staff alloc] initWithUsername:self.signupUsername.text password:self.signupPassword.text role:self.roleSelector.selectedSegmentIndex];
    
    [[CDManager sharedManager] saveStaff:staff];
    
    if(staff.role == 0) [self performSegueWithIdentifier:@"toRegister" sender:nil];
    else if(staff.role == 1) [self performSegueWithIdentifier:@"toKitchen" sender:nil];
    else [self performSegueWithIdentifier:@"toDelivery" sender:nil];
}


@end
