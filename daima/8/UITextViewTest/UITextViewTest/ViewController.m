//
//  ViewController.m
//  UITextViewTest


#import "ViewController.h"

@implementation ViewController{
	UIBarButtonItem* _done;
	UINavigationItem* _navItem;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 将该控制器本身设置为textView控件的委托对象
	self.textView.delegate = self;
	// 创建并添加导航条
	UINavigationBar* navBar = [[UINavigationBar alloc]
		initWithFrame:CGRectMake(0, 20
		, [UIScreen mainScreen].bounds.size.width, 44)];
	[self.view addSubview:navBar];
	// 创建导航项，并设置导航项的标题
	_navItem = [[UINavigationItem alloc]
		initWithTitle:@"导航条"];
	// 将导航项添加到导航条中
	navBar.items = @[_navItem];
	// 创建一个UIBarButtonItem对象，并赋给_done成员变量
	_done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
		UIBarButtonSystemItemDone
		target:self action:@selector(finishEdit)];
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
	// 为导航条设置右边的按钮
	_navItem.rightBarButtonItem = _done;
}
- (void)textViewDidEndEditing:(UITextView *)textView {
	// 取消导航条设置右边的按钮
	_navItem.rightBarButtonItem = nil;
}
- (void) finishEdit {
	// 让textView控件放弃作为第一响应者
	[self.textView resignFirstResponder];
}
@end
