//
//  ViewController.m
//  上下文动画
//
//  Created by 郭丰锐 on 2017/8/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIView* myView;
- (IBAction)btnAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.myView setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:self.myView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAction:(id)sender {
    //声明动画开始
    [UIView beginAnimations:@"animationsName" context:nil];
    //设置持续时间
    [UIView setAnimationDuration:1.5];
    //设置重复次数
    [UIView setAnimationRepeatCount:1];
    //设置动画反转
    //[UIView setAnimationRepeatAutoreverses:YES];
    //设置动画块回调
    [UIView setAnimationDelegate:self];
    //手动设定两个回调方法
    [UIView setAnimationWillStartSelector:@selector(animationWillStart:)];
    [UIView setAnimationDidStopSelector:@selector(animationWillStop)];
    //设置动画的渐变曲线 UIViewAnimationCurveEaseInOut,
    //UIViewAnimationCurveEaseIn,
    //UIViewAnimationCurveEaseOut,
    //UIViewAnimationCurveLinear,
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设定视图的变化，支持frame，bounds，alpha，center,transform
    //[self.myView setFrame:CGRectMake(100, 300, 200, 200)];
    //设置变化颜色
   // [self.myView setBackgroundColor:[UIColor redColor]];
    //self.myView.alpha = 0.5;
    //旋转、移动、缩放
    //CGAffineTransform
    //处理移动
    //确定值
    //self.myView.transform = CGAffineTransformMakeTranslation(<#CGFloat tx#>, <#CGFloat ty#>)
    //相对值
    self.myView.transform = CGAffineTransformTranslate(self.myView.transform, 20, 20);
    //缩放
    self.myView.transform = CGAffineTransformScale(self.myView.transform, 1.5, 1.5);
    //提交动画块
    [UIView commitAnimations];
}
-(void)animationWillStart:(NSString*)name{
    //可以通过参数区分是当前哪一个动画块
    NSLog(@"%@动画块开始执行",name);
}
-(void)animationWillStop{
    NSLog(@"动画块结束执行");
}@end
