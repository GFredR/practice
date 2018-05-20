//
//  DetailViewController.m
//  UICollectionViewTest
//


#import "DetailViewController.h"

@implementation DetailViewController{
	NSArray* _bookDetails;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	_bookDetails = @[
	   @"前端开发知识",
	   @"Andrioid销量排行榜榜首。",
	   @"介绍HTML 5、CSS3、JavaScript知识" ,
	   @"Java图书，值得仔细阅读的图书",
	   @"重点图书",
	   @"Java3大框架整合开发",
	   @"EJB 3",
	   @"图书"];
}
- (void)viewWillAppear:(BOOL)animated
{
	// 设置bookCover控件显示的图片
	self.bookCover.image = [UIImage imageNamed:self.imageName];
	// 设置bookDetail显示的内容
	self.bookDetail.text = _bookDetails[self.bookNo];
}
@end
