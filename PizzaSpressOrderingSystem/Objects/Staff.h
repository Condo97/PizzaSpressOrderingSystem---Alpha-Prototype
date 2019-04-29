//
//  Staff.h
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/26/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Staff : NSObject

@property (strong, nonatomic) NSString *username, *password;
@property (nonatomic) int role;

- (id)initWithUsername:(NSString *)username password:(NSString *)password role:(int)role;

@end

NS_ASSUME_NONNULL_END
