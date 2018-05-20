//
//  ViewController.m
//  UIControl交互
//
//  Created by 郭丰锐 on 2017/7/27.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
/*
 枚举用什么方式赋值成员变量有什么区别？
 普通值赋值 只能选择一个成员变量使用
 位运算方式赋值 可以多个 RIGHT | LEFT
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    /*
     addTarget:响应用户事件的对象 action：对象可以执行的方法 event用户事件的种类
     */
    
    [super viewDidLoad];
    UIControl* control = [[UIControl alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    control.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:control];
    //target必须能响应action
    [control addTarget:self action:@selector(touchAcotion:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)randomColorValue{
    return random()%255+1;
}
- (void)touchAcotion:(id)sender{
    UIColor* randColor = [UIColor colorWithRed:[self randomColorValue]/255.0 green:[self randomColorValue]/255.0 blue:[self randomColorValue]/255.0 alpha:1];
    [self.view setBackgroundColor:randColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
