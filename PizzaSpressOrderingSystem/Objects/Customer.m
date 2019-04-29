//
//  Customer.m
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/26/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (id)initWithPhone:(NSString *)phone streetAddress:(NSString *)streetAddress deliveryInstructions:(NSString *)deliveryInstructions creditCard:(NSString *)creditCard name:(NSString *)name {
    self = [self init];
    
    self.phone = phone;
    self.streetAddress = streetAddress;
    self.deliveryInstructions = deliveryInstructions;
    self.creditCard = creditCard;
    self.name = name;
    
    return self;
}

@end
