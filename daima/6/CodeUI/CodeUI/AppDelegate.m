//
//  AppDelegate.m
//  CodeUI
//


#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic , strong) UILabel* show;
@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// 创建UIWindow对象，并将该UIWindow初始化为与屏幕相同大小
	self.window = [[UIWindow alloc] initWithFrame:
				   [UIScreen mainScreen].bounds];
	// 设置UIWindow的背景色
	self.window.backgroundColor = [UIColor whiteColor];
	// 创建一个UIViewController对象
	UIViewController* controller = [[UIViewController alloc] init];
	// 让该程序的窗口加载并显示viewController视图控制器关联的用户界面
	self.window.rootViewController = controller;
	// 创建一个UIView对象
	UIView* rootView = [[UIView alloc] initWithFrame:
					[UIScreen mainScreen].bounds];
	// 设置controller显示rootView控件
	controller.view = rootView;
	// 创建一个系统风格的按钮
	UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
	// 设置按钮的大小
	button.frame = CGRectMake(120, 100, 80, 40);
	// 为按钮设置文本
	[button setTitle:@"确定" forState:UIControlStateNormal];
	// 将按钮添加到rootView控件中
	[rootView addSubview: button];
	// 创建一个UILabel对象
	self.show = [[UILabel alloc] initWithFrame:
				CGRectMake(60 , 40 , 180 , 30)];
	// 将UILabel添加到rootView控件中
	[rootView addSubview: self.show];
	// 设置UILabel默认显示的文本
	self.show.text = @"初始文本";
	self.show.backgroundColor = [UIColor grayColor];
	// 为按钮的触碰事件绑定事件处理方法
	[button addTarget:self action:@selector(tappedHandler:)
	 		forControlEvents:UIControlEventTouchUpInside];
	// 将该UIWindow对象设为主窗口并显示出来
	[self.window makeKeyAndVisible];
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
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) tappedHandler: (UIButton*) sender
{
	self.show.text = @"开始学习iOS吧！";
}
@end
