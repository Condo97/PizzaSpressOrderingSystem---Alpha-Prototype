//
//  AppDelegate.h
//  PizzaSpressOrderingSystem
//
//  Created by Alex Coundouriotis on 4/26/19.
//  Copyright © 2019 Alex Coundouriotis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

