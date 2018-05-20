//
//  AppDelegate.m


#import "AppDelegate.h"
@import HealthKit;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.healthStore = [[HKHealthStore alloc] init];
    
    UITabBarController *tabBarController = (UITabBarController *)[self.window rootViewController];
    
    for (UINavigationController *navigationController in tabBarController.viewControllers)
    {
        id viewController = navigationController;
        
        if ([viewController respondsToSelector:@selector(setHealthStore:)])
        {
            [viewController setHealthStore:self.healthStore];
        }
    }

    return YES;
}



@end
