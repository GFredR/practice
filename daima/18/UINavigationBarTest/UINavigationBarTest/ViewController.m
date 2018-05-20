//
//  ViewController.m
//  UINavigationBarTest
//


#import "ViewController.h"

@implementation ViewController{
	// 记录当前是添加第几个UINavigationItem的计数器
	NSInteger _count;
	UINavigationBar * _navigationBar;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	_count = 1;
	// 创建一个导航栏
	_navigationBar = [[UINavigationBar alloc]
		initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 44)];
	// 把导航栏添加到视图中
	[self.view addSubview:_navigationBar];
	// 调用push方法添加一个UINavigationItem
	[self push];
}
-(void)push
{
	// 把导航项集合添加到导航栏中，设置动画打开
	[_navigationBar pushNavigationItem:
		[self makeNavItem] animated:YES];
	_count++;
}
-(void)pop
{
	// 如果还有超过两个的UINavigationItem
	if(_count > 2)
	{
		_count--;
		// 弹出最顶层的UINavigationItem
		[_navigationBar popNavigationItemAnimated:YES];
	}
	else
	{
		// 使用UIAlertView提示用户
		UIAlertView* alert = [[UIAlertView alloc]
			initWithTitle:@"提示"
			message:@"只剩下最后一个导航项，再出栈就没有了"
			delegate:nil cancelButtonTitle:@"OK"
			otherButtonTitles: nil];
		[alert show];
	}
}
- (UINavigationItem*) makeNavItem
{
	// 创建一个导航项
	UINavigationItem *navigationItem = [[UINavigationItem alloc]
		initWithTitle:nil];
	// 创建一个左边按钮
	UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
		target:self action:@selector(push)];
	// 创建一个右边按钮
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
		initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
		target:self action:@selector(pop)];
	//设置导航栏内容
	navigationItem.title = [NSString stringWithFormat:
		@"第【%ld】个导航项" , _count];
	//把左右两个按钮添加到导航项集合中
	[navigationItem setLeftBarButtonItem:leftButton];
	[navigationItem setRightBarButtonItem:rightButton];
	return navigationItem;
}
@end
