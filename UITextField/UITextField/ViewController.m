//
//  ViewController.m
//  UITextField
//
//  Created by 郭丰锐 on 2017/8/12.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    UITextField* field = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, CGRectGetWidth(self.view.frame)-100, 30)];
    
    //文字设置
    field.textColor = [UIColor lightGrayColor];
    [field setTextAlignment:NSTextAlignmentCenter];
    //图片设置
    [field setBackground:[UIImage imageNamed:@"background"]];
    UIImageView* leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    leftImageView.image = [UIImage imageNamed:@"userName"];
    [field setLeftViewMode:UITextFieldViewModeAlways];
    [field setLeftView:leftImageView];
    //一般不会对文本框添加target：action：方法，大部分交互操作通过委托技术和通知技术来实现
    //风格
    [field setBorderStyle:UITextBorderStyleBezel];
    //设置提示内容
    [field setPlaceholder:@"请输入账号"];
    //设置清除按钮
    [field setClearButtonMode:UITextFieldViewModeAlways];
    [self.view addSubview:field];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
