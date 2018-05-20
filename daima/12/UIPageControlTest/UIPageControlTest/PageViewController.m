//
//  PageViewController.m
//  UIPageControlTest


#import "PageViewController.h"

@implementation PageController
- (id)initWithPageNumber:(NSInteger)pageNumber
{
	self = [super initWithNibName:nil bundle:nil];
	if (self)
	{
		self.label = [[UILabel alloc] initWithFrame:
			CGRectMake(260 , 10 , 60 , 30)];
		self.label.backgroundColor = [UIColor clearColor];
		self.label.textColor = [UIColor redColor];
		self.label.text = [NSString stringWithFormat:@"第[%ld]页"
			, pageNumber + 1];
		[self.view addSubview:self.label];
		self.bookLabel = [[UILabel alloc] initWithFrame:
			CGRectMake(0, 30, CGRectGetWidth(self.view.frame), 60)];
		self.bookLabel.textAlignment = NSTextAlignmentCenter;
		self.bookLabel.numberOfLines = 2;
		self.bookLabel.font = [UIFont systemFontOfSize:24];
		self.bookLabel.backgroundColor = [UIColor clearColor];
		self.bookLabel.textColor = [UIColor blueColor];
		[self.view addSubview:self.bookLabel];
		self.bookImage = [[UIImageView alloc] initWithFrame:
			CGRectMake(0, 90, CGRectGetWidth(self.view.frame), 320)];
		self.bookImage.contentMode = UIViewContentModeScaleAspectFit;
		[self.view addSubview:self.bookImage];
	}
	return self;
}
@end
