//
//  AppDelegate.m
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/13.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CollectionViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    ViewController* vc = [[ViewController alloc]init];
    UINavigationController* newsNav = [[UINavigationController alloc]initWithRootViewController:vc];
    [newsNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_bg_normal@2x"] forBarMetrics:UIBarMetricsDefault];
    
    CollectionViewController* collVC = [[CollectionViewController alloc]init];
    UINavigationController* colNav = [[UINavigationController alloc]initWithRootViewController:collVC];
    [colNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_bg_normal@2x"] forBarMetrics:UIBarMetricsDefault];
    
    UITabBarController* tab = [[UITabBarController alloc]init];
    
    [tab setViewControllers:@[newsNav,colNav]];
    [tab.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar@2x"]];
    
    newsNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"新闻" image:nil selectedImage:nil];
    colNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"表格" image:nil selectedImage:nil];
    
   [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25]} forState:UIControlStateNormal];
    [newsNav.tabBarItem setSelectedImage:[UIImage imageNamed:@"deactivated_btn@2x"]];
    
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
