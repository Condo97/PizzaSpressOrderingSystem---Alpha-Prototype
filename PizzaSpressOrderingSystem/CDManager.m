//
//  CDHandler.m
//  Calc
//
//  Created by Alex Coundouriotis on 6/13/17.
//  Copyright © 2017 ACApplications. All rights reserved.
//

#import "CDManager.h"
#import "AppDelegate.h"

@implementation CDManager

+ (id)sharedManager {
    static CDManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (Customer *)getCustomer:(NSString *)phone {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"CustomerE"];
    NSError *error;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"phone == %@", phone];
    [request setPredicate:predicate];
    NSArray *resultArray = [context executeFetchRequest:request error:&error];
    
    Customer *customer = NULL;
    
    for(NSManagedObject *object in resultArray) {
        customer = [[Customer alloc] initWithPhone:(NSString *)[object valueForKey:@"phone"]
                                     streetAddress:(NSString *)[object valueForKey:@"streetAddress"]
                              deliveryInstructions:(NSString *)[object valueForKey:@"deliveryInstructions"]
                                        creditCard:(NSString *)[object valueForKey:@"creditCard"]
                                              name:(NSString *)[object valueForKey:@"name"]];
    }
    
    return customer;
}

- (Staff *)getStaff:(NSString *)user pass:(NSString *)pass {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"StaffE"];
    NSError *error;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username == %@", user];
    [request setPredicate:predicate];
    NSArray *resultArray = [context executeFetchRequest:request error:&error];
    
    for(NSManagedObject *object in resultArray) {
        Staff *staff = [[Staff alloc] initWithUsername:(NSString *)[object valueForKey:@"username"]
                                       password:(NSString *)[object valueForKey:@"password"]
                                           role:((NSNumber *)[object valueForKey:@"role"]).intValue];
        
        if([pass isEqualToString:staff.password]) return staff;
    }
    
    return NULL;
}

- (Order *)getOrder:(int)orderID {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"OrderE"];
    NSError *error;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"orderID == %d", orderID];
    [request setPredicate:predicate];
    NSArray *resultArray = [context executeFetchRequest:request error:&error];
    
    Order *order = NULL;
    
    for(NSManagedObject *object in resultArray) {
        order = [[Order alloc] initWithPhone:(NSString *)[object valueForKey:@"customerPhone"]
                                     address:(NSString *)[object valueForKey:@"address"]
                                  creditCard:(NSString *)[object valueForKey:@"creditCard"]
                                       items:(NSString *)[object valueForKey:@"items"]
                                        date:(NSString *)[object valueForKey:@"date"]
                               scheduledDate:(NSString *)[object valueForKey:@"scheduledDate"]
                                     orderID:((NSNumber *)[object valueForKey:@"orderID"]).intValue
                                   fulfilled:((NSNumber *)[object valueForKey:@"fulfilled"]).intValue];
    }
    
    return order;
}

- (void)saveCustomer:(Customer *)customer {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"CustomerE" inManagedObjectContext:context];
    
    [managedObject setValue:customer.creditCard forKey:@"creditCard"];
    [managedObject setValue:customer.deliveryInstructions forKey:@"deliveryInstructions"];
    [managedObject setValue:customer.phone forKey:@"phone"];
    [managedObject setValue:customer.streetAddress forKey:@"streetAddress"];
    [managedObject setValue:customer.name forKey:@"name"];
    
    NSError *error;
    [context save:&error];
}

- (void)saveStaff:(Staff *)staff {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"StaffE" inManagedObjectContext:context];
    
    [managedObject setValue:staff.username forKey:@"username"];
    [managedObject setValue:staff.password forKey:@"password"];
    [managedObject setValue:[NSNumber numberWithInt:staff.role] forKey:@"role"];
    
    NSError *error;
    [context save:&error];
}

- (void)saveOrder:(Order *)order {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"OrderE" inManagedObjectContext:context];
    
    [managedObject setValue:order.address forKey:@"address"];
    [managedObject setValue:order.creditCard forKey:@"creditCard"];
    [managedObject setValue:order.customerPhone forKey:@"customerPhone"];
    [managedObject setValue:order.date forKey:@"date"];
    [managedObject setValue:order.items forKey:@"items"];
    [managedObject setValue:order.scheduledDate forKey:@"scheduledDate"];
    [managedObject setValue:[NSNumber numberWithInt:order.fulfilled] forKey:@"fulfilled"];
    [managedObject setValue:[NSNumber numberWithInt:order.orderID] forKey:@"orderID"];
    
    NSError *error;
    [context save:&error];
}

- (void)updateOrderStatus:(Order *)order {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"OrderE"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"orderID == %d", order.orderID];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *managedObjects = [context executeFetchRequest:request error:&error];
    
    for(NSManagedObject *object in managedObjects) {
        [object setValue:[NSNumber numberWithInt:order.fulfilled] forKey:@"fulfilled"];
    }
    
    NSError *error2;
    [context save:&error2];
}

- (NSMutableArray *)getOrdersForStatus:(int)status {
    NSManagedObjectContext *context = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"OrderE"];
    NSError *error;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"fulfilled == %d", status];
    [request setPredicate:predicate];
    NSArray *resultArray = [context executeFetchRequest:request error:&error];
    
    NSMutableArray<Order *> *orders = [[NSMutableArray alloc] init];;
    
    for(NSManagedObject *object in resultArray) {
        [orders addObject:[[Order alloc] initWithPhone:(NSString *)[object valueForKey:@"customerPhone"]
                                     address:(NSString *)[object valueForKey:@"address"]
                                  creditCard:(NSString *)[object valueForKey:@"creditCard"]
                                       items:(NSString *)[object valueForKey:@"items"]
                                        date:(NSString *)[object valueForKey:@"date"]
                               scheduledDate:(NSString *)[object valueForKey:@"scheduledDate"]
                                     orderID:((NSNumber *)[object valueForKey:@"orderID"]).intValue
                                   fulfilled:((NSNumber *)[object valueForKey:@"fulfilled"]).intValue]];
    }
    
    return orders;
}

@end
