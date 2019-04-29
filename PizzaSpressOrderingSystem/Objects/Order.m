//
//  Order.m
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/26/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import "Order.h"

@implementation Order

- (id)initWithPhone:(NSString *)phone address:(NSString *)address creditCard:(NSString *)creditCard items:(NSString *)items date:(NSString *)date scheduledDate:(NSString *)scheduledDate orderID:(int)orderID fulfilled:(int)fulfilled {
    self = [self init];
    
    self.customerPhone = phone;
    self.address = address;
    self.creditCard = creditCard;
    self.items = items;
    self.date = date;
    self.scheduledDate = scheduledDate;
    self.orderID = orderID;
    self.fulfilled = fulfilled;
    
    return self;
}

@end
