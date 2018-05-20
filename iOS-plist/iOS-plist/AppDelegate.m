//
//  AppDelegate.m
//  iOS-plist
//
//  Created by 郭丰锐 on 2017/7/11.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //沙盒目录 支持读写
    NSString* documentPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSLog(@"documentFile:%@",documentPath);
    NSString* filePath = [documentPath stringByAppendingPathComponent:@"mylist.plist"];
    //动态加载本地文件
    //NSString* filePath = [[NSBundle mainBundle] pathForResource:@"dataList" ofType:@"plist"];
    //NSString* filePath = @"/Users/guofengrui/Desktop/iOS假期练习/iOS-plist/iOS-plist/dataList.plist";
    //NSArray* dataSource = [NSArray arrayWithContentsOfFile:filePath];
    //for (int i = 0; i<dataSource.count; i++) {
    //    NSLog(@"dataSource:%@",dataSource[i]);
    //}
    NSArray* myData = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    BOOL result = [myData writeToFile:filePath atomically:YES];
    if (result) {
        NSLog(@"写入成功");
    }
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
