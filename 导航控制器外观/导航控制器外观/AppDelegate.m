//
//  AppDelegate.m
//  导航控制器外观
//
//  Created by 郭丰锐 on 2017/10/27.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow* window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    self.window = window;
    FirstViewController* firstVC = [[FirstViewController alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    self.window.rootViewController = nav;
    
    /*
     状态栏高度 20
     导航条高度为44 （一倍图）88 132
     */
    //设置背景颜色
    [nav.navigationBar setBackgroundColor:[UIColor greenColor]];
    //[nav.navigationBar setAlpha:50.0];
    //设置背景图片
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar@2x"] forBarMetrics:UIBarMetricsDefault];
    nav.title = @"首页";
    [self.window makeKeyAndVisible];
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
