//
//  Customer.h
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/26/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Customer : NSObject

@property (strong, nonatomic) NSString *creditCard, *deliveryInstructions, *phone, *streetAddress, *name;

- (id)initWithPhone:(NSString *)phone streetAddress:(NSString *)streetAddress deliveryInstructions:(NSString *)deliveryInstructions creditCard:(NSString *)creditCard name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
