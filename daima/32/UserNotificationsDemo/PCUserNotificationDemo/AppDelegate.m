//
//  AppDelegate.m


#import "AppDelegate.h"
#import "ViewController.h"


@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self registerForNotification];
    return YES;
}

- (void)registerForNotification
{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted)
        {
            UNNotificationAction *actOne = [UNNotificationAction actionWithIdentifier:ActionIdentifier title:@"Enter" options:UNNotificationActionOptionForeground];
            UNNotificationAction *actTwo = [UNNotificationAction actionWithIdentifier:ActionIdentifier title:@"Close" options:UNNotificationActionOptionDestructive];
            UNNotificationAction *actThree = [UNNotificationAction actionWithIdentifier:ActionIdentifier title:@"None" options:UNNotificationActionOptionNone];
            
            UNNotificationCategory *plainCategory = [UNNotificationCategory categoryWithIdentifier:NotificationTypePlainId actions:@[actOne,actTwo] minimalActions:@[] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];
            
            UNNotificationCategory *serviceCategory = [UNNotificationCategory categoryWithIdentifier:NotificationTypeServiceExtensionId actions:@[actOne,actThree] minimalActions:@[actTwo] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];
            
            UNNotificationCategory *contentCategory = [UNNotificationCategory categoryWithIdentifier:NotificationTypeContentExtensionId actions:@[actOne,actTwo,actThree] minimalActions:@[actThree] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];
            
            [center setNotificationCategories:[NSSet setWithObjects:plainCategory,serviceCategory,contentCategory, nil]];
        }
    }];
}

#pragma mark UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{
    NSString *actid = response.actionIdentifier;
    if (![actid isEqualToString:ActionIdentifier])
    {
        completionHandler();
    }
    else
    {
        ViewController *vc = (ViewController *)self.window.rootViewController;
        [vc showImage];
    }
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    completionHandler(UNNotificationPresentationOptionAlert);
}

@end
