//
//  ViewController.m
//  UIActivityIndicatorViewTest


#import "ViewController.h"

@implementation ViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
}
- (IBAction)start:(id)sender {
	// 控制4个进度环开始转动
	for(int i = 0 ; i < self.indicators.count ; i++)
	{
		[self.indicators[i] startAnimating];
	}
}
- (IBAction)stop:(id)sender {
	// 停止4个进度环的转动
	for(int i = 0 ; i < self.indicators.count ; i++)
	{
		[self.indicators[i] stopAnimating];
	}
}
@end
