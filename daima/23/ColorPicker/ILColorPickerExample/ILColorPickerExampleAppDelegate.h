
#import <UIKit/UIKit.h>

@class ILColorPickerDualExampleController;

@interface ILColorPickerExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UITabBarController *tabController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabController;

@end
