//
//  ViewController.m
//  UILabel
//
//  Created by 郭丰锐 on 2017/7/11.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取屏幕宽度
    //CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat width = CGRectGetWidth(self.view.frame);
    NSString* exmpleString = @"我不想就这样一直走,啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, width-40, 100)];
    //进行属性设置
    [label setBackgroundColor:[UIColor blueColor]];
    //设置文字
    label.text = exmpleString;
    //设置字体大小
    [label setFont:[UIFont systemFontOfSize:30]];
    //设置字体颜色
    [label setTextColor:[UIColor yellowColor]];
    //设置对齐方式
    [label setTextAlignment:NSTextAlignmentCenter];
    //设置阴影,需设置阴影颜色
    [label setShadowOffset:CGSizeMake(5, 5)];
    [label setShadowColor:[UIColor blackColor]];
    //换行
    [label setNumberOfLines:0];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [self.view addSubview:label];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
