//
//  AppDelegate.h


#import <UIKit/UIKit.h>
@import HealthKit;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) HKHealthStore *healthStore;

@end

