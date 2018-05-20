//
//  ViewController.m
//  UIDatePickerTest


#import "ViewController.h"

@implementation ViewController
- (void)viewDidLoad
{
	[super viewDidLoad];
}
- (IBAction)tapped:(id)sender {
	// 获取用户通过UIDatePicker设置的日期和时间
	NSDate *selected = [self.datePicker date];
	// 创建一个日期格式器
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	// 为日期格式器设置格式字符串
	[dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm +0800"];
	// 使用日期格式器格式化日期、时间
	NSString *destDateString = [dateFormatter stringFromDate:selected];
	NSString *message =  [NSString stringWithFormat:
		@"您选择的日期和时间是：%@", destDateString];
	// 创建一个UIAlertView对象（警告框），并通过该警告框显示用户选择的日期、时间
	UIAlertView *alert = [[UIAlertView alloc]
		initWithTitle:@"日期和时间"
		message:message
		delegate:nil
		cancelButtonTitle:@"确定"
		otherButtonTitles:nil];
	// 显示UIAlertView
	[alert show];
}
@end
