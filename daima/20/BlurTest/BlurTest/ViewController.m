//
//  ViewController.m
//  BlurTest


#import "ViewController.h"

@implementation ViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	// 创建一个UIBlurEffectStyleLight风格的UIBlurEffect
	UIBlurEffect *light = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
	// 创建以light模糊效果创建UIVisualEffectView
	UIVisualEffectView *lightView = [[UIVisualEffectView alloc] initWithEffect:light];
	lightView.frame = CGRectMake(40, 40, 300, 100);
	// 为imageView添加模糊效果
	[self.imageView addSubview:lightView];
	// 创建一个UIBlurEffectStyleExtraLight风格的UIBlurEffect
	UIBlurEffect *extraLight = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
	// 创建以extraLight模糊效果创建UIVisualEffectView
	UIVisualEffectView *extraLightView = [[UIVisualEffectView alloc] initWithEffect:extraLight];
	extraLightView.frame = CGRectMake(40, 160, 300, 100);
	// 为imageView添加模糊效果
	[self.imageView addSubview:extraLightView];
	// 创建一个UIBlurEffectStyleDark风格的UIBlurEffect
	UIBlurEffect *dark = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
	// 创建以dark模糊效果创建UIVisualEffectView
	UIVisualEffectView *darkView = [[UIVisualEffectView alloc] initWithEffect:dark];
	darkView.frame = CGRectMake(40, 280, 300, 100);
	// 为imageView添加模糊效果
	[self.imageView addSubview:darkView];
	
	// 启用imageView的用户交互，保证该控件包含的子控件支持用户交互
	self.imageView.userInteractionEnabled = YES;
	// 创建一个UIButton按钮，并设置该按钮的文本
	UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
	btn1.frame = CGRectMake(10, 10, 200, 40);
	[btn1 setTitle:@"UIBlurEffectStyleLight" forState:UIControlStateNormal];
	// 为lightView模糊控件添加子控件
	[lightView.contentView addSubview:btn1];
	// 创建一个UIButton按钮，并设置该按钮的文本
	UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
	btn2.frame = CGRectMake(10, 10, 200, 40);
	[btn2 setTitle:@"UIBlurEffectStyleExtraLight" forState:UIControlStateNormal];
	// 为extraLightView模糊控件添加子控件
	[extraLightView.contentView addSubview:btn2];
	// 创建一个UIButton按钮，并设置该按钮的文本
	UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
	btn3.frame = CGRectMake(10, 10, 200, 40);
	[btn3 setTitle:@"UIBlurEffectStyleDark" forState:UIControlStateNormal];
	// 为darkView模糊控件添加子控件
	[darkView.contentView addSubview:btn3];
}
@end
