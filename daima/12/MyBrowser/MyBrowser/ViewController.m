//
//  ViewController.m
//  MyBrowser


#import "ViewController.h"

@implementation ViewController{
	UIActivityIndicatorView* _activityIndicator;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	// 设置自动缩放网页以适应该控件
	self.webView.scalesPageToFit = YES;
	// 为UIWebView控件设置委托
	self.webView.delegate = self;
	// 创建一个UIActivityIndicatorView控件
	_activityIndicator = [[UIActivityIndicatorView alloc]
		initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
	// 控制UIActivityIndicatorView显示在当前View的中央
	[_activityIndicator setCenter: self.view.center];
	_activityIndicator.activityIndicatorViewStyle
		= UIActivityIndicatorViewStyleWhiteLarge;
	[self.view addSubview : _activityIndicator];
	// 隐藏_activityIndicator控件
	_activityIndicator.hidden = YES;
}
// 当UIWebView开始加载时激发该方法
- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// 显示_activityIndicator控件
	_activityIndicator.hidden = NO;
	// 启动_activityIndicator控件的转动
	[_activityIndicator startAnimating] ;
}
// 当UIWebView加载完成时激发该方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// 停止_activityIndicator控件的转动
	[_activityIndicator stopAnimating];
	// 隐藏_activityIndicator控件
	_activityIndicator.hidden = YES;
}
// 当UIWebView加载失败时激发该方法
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// 使用UIAlertView显示错误信息
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
		message:[error localizedDescription]
		delegate:nil cancelButtonTitle:nil
		otherButtonTitles:@"确定", nil];
	[alert show];
}
- (IBAction)goTapped:(id)sender {
	[self.addr resignFirstResponder];
	// 获取用户输入的字符串
	NSString* reqAddr = self.addr.text;
	// 如果reqAddr不以http://开头，为该用户输入的网址添加http://前缀
	if (![reqAddr hasPrefix:@"http://"]) {
		reqAddr = [NSString stringWithFormat:@"http://%@" , reqAddr];
		self.addr.text = reqAddr;
	}
	NSURLRequest* request = [NSURLRequest requestWithURL:
		[NSURL URLWithString:reqAddr]];
	// 加载指定URL对应的网址
	[self.webView loadRequest:request];
}
@end
