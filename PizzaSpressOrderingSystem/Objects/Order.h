//
//  Order.h
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/26/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Order : NSObject

@property (strong, nonatomic) NSString *address, *creditCard, *customerPhone, *items, *date, *scheduledDate;
@property (nonatomic) int orderID, fulfilled;

- (id)initWithPhone:(NSString *)phone address:(NSString *)address creditCard:(NSString *)creditCard items:(NSString *)items date:(NSString *)date scheduledDate:(NSString *)scheduledDate orderID:(int)orderID fulfilled:(int)fulfilled;

@end

NS_ASSUME_NONNULL_END
