//
//  AppDelegate.m
//  ToDoApp
//
//  Created by Aleksandr Demishkevych on 11/8/15.
//  Copyright © 2015 Techery. All rights reserved.
//

#import "AppDelegate.h"
#import <AppleGuice/AppleGuice.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (void)initialize {
    [AppleGuice startService];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

@end
