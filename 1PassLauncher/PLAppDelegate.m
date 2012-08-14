//
//  PLAppDelegate.m
//  1PassLauncher
//
//  Created by itok on 2012/08/15.
//  Copyright (c) 2012 itok. All rights reserved.
//

#import "PLAppDelegate.h"

@implementation PLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    [self launch1Password];
    
    return YES;
}

-(void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [self launch1Password];
}

-(void) applicationWillResignActive:(UIApplication *)application
{
    UIApplication* app = [UIApplication sharedApplication];
    [app setApplicationIconBadgeNumber:0];
    [app cancelAllLocalNotifications];

    UILocalNotification* not = [[UILocalNotification alloc] init];
    not.alertBody = @"Launch";
    not.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    [app scheduleLocalNotification:not];
}

-(void) launch1Password
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"1password:"]];
}

@end
