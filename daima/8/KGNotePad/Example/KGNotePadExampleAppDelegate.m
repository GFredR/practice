//
//  KGNotePadExampleAppDelegate.m
//  KGNotePadExample


#import "KGNotePadExampleAppDelegate.h"
#import "KGNotePadExampleViewController.h"

@implementation KGNotePadExampleAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[KGNotePadExampleViewController alloc] initWithNibName:nil bundle:nil];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
