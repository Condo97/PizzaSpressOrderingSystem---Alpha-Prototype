//
//  CDHandler.h
//  Calc
//
//  Created by Alex Coundouriotis on 6/13/17.
//  Copyright © 2017 ACApplications. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import "Customer.h"
#import "Staff.h"
#import "Order.h"

@interface CDManager : NSObject

+ (id)sharedManager;
- (Customer *)getCustomer:(NSString *)phone;
- (Staff *)getStaff:(NSString *)user pass:(NSString *)pass;
- (Order *)getOrder:(int)orderID;
- (void)saveCustomer:(Customer *)customer;
- (void)saveStaff:(Staff *)staff;
- (void)saveOrder:(Order *)order;
- (void)updateOrderStatus:(Order *)order;
- (NSMutableArray *)getOrdersForStatus:(int)status;

@end
