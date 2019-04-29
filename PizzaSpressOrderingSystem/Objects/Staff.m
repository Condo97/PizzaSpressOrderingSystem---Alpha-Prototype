//
//  Staff.m
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/26/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import "Staff.h"

@implementation Staff

- (id)initWithUsername:(NSString *)username password:(NSString *)password role:(int)role {
    self = [self init];
    
    self.username = username;
    self.password = password;
    self.role = role;
    
    return self;
}

@end
