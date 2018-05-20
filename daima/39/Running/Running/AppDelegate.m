//
//  AppDelegate.m


#import "AppDelegate.h"

#import <Intents/Intents.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //just testing if any thing happending
    //--------------------------------------
    if(launchOptions != nil) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"lo.plist"];
        [launchOptions writeToFile:filePath atomically:YES];
    }
    else {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"lo.plist"];
        
        BOOL existFile = NO;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        existFile = [fileManager fileExistsAtPath:filePath];
        
        if (existFile) {
            NSDictionary *lo = [NSDictionary dictionaryWithContentsOfFile:filePath];
            NSLog(@"%@",lo);
        }
    }
    //--------------------------------------
    
    [INPreferences requestSiriAuthorization:^(INSiriAuthorizationStatus status) {
        if(status == INSiriAuthorizationStatusNotDetermined) {
            NSLog(@"Siri not authorization yet");
        }
        else if(status == INSiriAuthorizationStatusRestricted) {
            NSLog(@"Siri authorization restricted");
        }
        else if(status == INSiriAuthorizationStatusDenied) {
            NSLog(@"Siri authorization denied");
        }
        else if(status == INSiriAuthorizationStatusAuthorized) {
            NSLog(@"Siri authorization authorized");
        }
    }];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
