//
//  WDAppDelegate.m
//  TranslateTool
//
//  Created by wang on 12-11-13.
//  Copyright (c) 2012年 wang. All rights reserved.
//

#import "WDAppDelegate.h"
#import "WDTranslateViewController.h"
#import "WDWordListViewController.h"

@implementation WDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    WDTranslateViewController * translateViewController = [[WDTranslateViewController alloc] init];
    translateViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"翻译" image:[UIImage imageNamed:@"book_side_icon&32.png"] tag:0];
    
    WDWordListViewController * wordListController = [[WDWordListViewController alloc] init];
    
    NSMutableArray * controllers = [[NSMutableArray alloc] init];
    [controllers addObject:translateViewController];
    [controllers addObject:wordListController];
    
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    //tabBarController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:1];
    tabBarController.viewControllers = controllers;
    tabBarController.selectedIndex = 0;
    
    self.window.rootViewController = tabBarController;
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
