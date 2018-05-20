//
//  ViewController.m
//  UIImageViewTest


#import "ViewController.h"

@implementation ViewController{
	NSArray* _images;
	int _curImage;
	CGFloat _alpha;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	_curImage = 0;
	_alpha = 1.0;
	_images = @[@"lijiang.jpg", @"qiao.jpg", @"xiangbi.jpg"
		, @"shui.jpg", @"shuangta.jpg" ];
	// 启用iv1控件的用户交互，从而允许该控件能响应用户手势
	self.iv1.userInteractionEnabled = YES;
	// 创建一个轻击的手势检测器
	UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
		initWithTarget:self action:@selector(tapped:)];
	[self.iv1 addGestureRecognizer:singleTap]; // 为UIImageView添加手势检测器
}
- (IBAction)plus:(id)sender {
	_alpha += 0.02;
	// 如果透明度已经大于或等于1.0，将透明度设置为1.0
	if(_alpha >= 1.0)
	{
		_alpha = 1.0;
	}
	self.iv1.alpha = _alpha;  // 设置iv1控件的透明度
}

- (IBAction)minus:(id)sender {
	_alpha -= 0.02;
	// 如果透明度已经小于或等于0.0，将透明度设置为0.0
	if(_alpha <= 0.0)
	{
		_alpha = 0.0;
	}
	self.iv1.alpha = _alpha;  // 设置iv1控件的透明度
}

- (IBAction)next:(id)sender {
	// 控制iv1的image显示_images数组中的下一张图片
	self.iv1.image = [UIImage imageNamed:
		_images[++_curImage % _images.count]];
}
- (void) tapped:(UIGestureRecognizer *)gestureRecognizer
{
	UIImage* srcImage = self.iv1.image;  // 获取正在显示的原始位图
	// 获取用户手指在iv1控件上的触碰点
	CGPoint pt = [gestureRecognizer locationInView: self.iv1];
	// 获取正在显示的原图对应的CGImageRef
	CGImageRef sourceImageRef = [srcImage CGImage];
	// 获取图片实际大小与第一个UIImageView的缩放比例
	CGFloat scale = srcImage.size.width / 320;
	// 将iv1控件上触碰点的左边换算成原始图片上的位置
	CGFloat x = pt.x * scale;
	CGFloat y = pt.y * scale;
	if(x + 120  > srcImage.size.width)
	{
		x = srcImage.size.width - 140;
	}
	if(y + 120  > srcImage.size.height)
	{
		y = srcImage.size.height - 140;
	}
	// 调用CGImageCreateWithImageInRect函数获取sourceImageRef中指定区域的图片
	CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef
		, CGRectMake(x,  y, 140, 140));
	// 让iv2控件显示newImageRef对应的图片
	self.iv2.image = [UIImage imageWithCGImage:newImageRef];
}
@end
