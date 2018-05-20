//
//  ViewController.m
//  UIButton外观定制
//
//  Created by 郭丰锐 on 2017/7/30.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self coustomButton];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)systemButton{
    //指定按钮样式，来初始化一个按钮
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
    //设置标题 背景色 背景图
    //normal状态的按钮
    [btn setTitle:@"购买" forState:UIControlStateNormal];
    //heighlight状态按钮
    [btn setTitle:@"确认" forState:UIControlStateHighlighted];
    //设定按钮背景色
    //普通按钮的背景
    [btn setImage:[UIImage imageNamed:@"icon_create_shetuan_n"] forState:UIControlStateNormal];
    //高亮按钮状态背景
    [btn setImage:[UIImage imageNamed:@"icon_create_shetuan_f"] forState:UIControlStateHighlighted];
    
    //[btn setBackgroundColor:[UIColor redColor]];
    //别忘了设置绘图矩阵frame
    [btn setFrame:CGRectMake(100, 100, 250, 100)];
    [self.view addSubview:btn];
}
- (void)coustomButton{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 200, 200)];
    [btn setTitle:@"普通按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    //[btn setImage:[UIImage imageNamed:@"icon_create_shetuan_n"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_create_shetuan_n"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    //[btn setImage:[UIImage imageNamed:@"icon_create_shetuan_f"] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:@"icon_create_shetuan_f"] forState:UIControlStateHighlighted];
    NSString* tittle = @"按钮标题";
    NSAttributedString* attrtittle = [[NSAttributedString alloc] initWithString:tittle attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:40]}];
    [btn setAttributedTitle:attrtittle forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
