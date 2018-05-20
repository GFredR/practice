//
//  DetailViewController.m
//  UICollectionViewTest


#import "DetailViewController.h"

@implementation DetailViewController{
	NSArray* _bookDetails;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	_bookDetails = @[
	   @"介绍了前端开发知识",
	   @"图书。",
	   @"前端开发基础知识" ,
	   @"值得仔细阅读的图书",
	   @"突破重点的图书",
	   @"3大框架整合开发的图书",
	   @"EJB 3开发图书",
	   @"Swift图书"];
}
- (void)viewWillAppear:(BOOL)animated
{
	// 设置bookCover控件显示的图片
	self.bookCover.image = [UIImage imageNamed:self.imageName];
	// 设置bookDetail显示的内容
	self.bookDetail.text = _bookDetails[self.bookNo];
}
@end
