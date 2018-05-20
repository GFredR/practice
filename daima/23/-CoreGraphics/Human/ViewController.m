//
//  ViewController.m


#import "ViewController.h"
#import "Circle.h"
@interface ViewController ()
{
    Circle *circle;
}
@end

@implementation ViewController
//-(void)viewWillAppear:(BOOL)animated
//{
//    //开始绘画
//    UIGraphicsBeginImageContext(self.view.bounds.size);
//    CGContextRef gc = UIGraphicsGetCurrentContext();
//    
//    //设置颜色
//    [[UIColor grayColor] setFill];
//    
//    //设置中心点
//    CGFloat cenx = CGRectGetMidX(self.view.bounds);
//    CGFloat ceny = CGRectGetMidY(self.view.bounds);
//    CGContextTranslateCTM(gc, cenx, ceny);
//    
//    //不断绘图并设置旋转
////    for(int i = 0; i < 12; i++)
////    {
//        CGContextAddRect(gc, CGRectMake(-5, 0, 10, 100));
//        CGContextFillPath(gc);
//        CGContextRotateCTM(gc, 30 * M_PI/180);
////    }
//    
//    //结束绘画
//    UIImage *destImg = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    //创建UIImageView并显示在界面上
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:destImg];
//    [self.view addSubview:imgView];
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    circle = [[Circle alloc] init];
//    [circle setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
//    [circle setBounds:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.width)];
//    circle.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:circle];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Begin the animation */
    [UIView beginAnimations:@"clockwiseAnimation" context:NULL];
    /* Make the animation 5 seconds long */
    [UIView setAnimationDuration:3];
    [UIView setAnimationRepeatCount:100];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    //停止动画时候调用clockwiseRotationStopped方法
//    [UIView setAnimationDidStopSelector:@selector(clockwiseRotationStopped:finished:context:)];
    //顺时针旋转90度
    circle.transform = CGAffineTransformMakeRotation( M_PI*1.75);
    /* Commit the animation */
    [UIView commitAnimations];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
