//
//  ViewController.h
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/26/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Staff.h"
#import "CDManager.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *loginUsername;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;

@property (weak, nonatomic) IBOutlet UITextField *signupUsername;
@property (weak, nonatomic) IBOutlet UITextField *signupPassword;

@property (weak, nonatomic) IBOutlet UISegmentedControl *roleSelector;

@end

