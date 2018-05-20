//
//  ViewController.m
//  子视图管理
//
//  Created by 郭丰锐 on 2017/7/10.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* superView = self.view;
    UIView* redView = [[UIView alloc] initWithFrame:CGRectMake(60, 60, 250, 250)];
    [redView setBackgroundColor:[UIColor redColor]];
    redView.tag = 10;
    [superView addSubview:redView];
    //父视图获取子视图
    UIView* subView1 = [superView viewWithTag:10];
    UIView* blueView = [[UIView alloc] initWithFrame:CGRectMake(70, 70, 250, 250)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.tag = 11;
    [superView addSubview:blueView];
   // UIView* subView2 = []
    //获取所有子视图
    NSArray* subViews = [superView subviews];
    for (UIView* subView in subViews) {
        NSLog(@"view.tag=%ld",subView.tag);
    }
    //移除子视图
   // [redView removeFromSuperview];
    //移动视图
    //[superView bringSubviewToFront:redView];
   // [superView sendSubviewToBack:blueView];
    UIView* subView2 = [superView viewWithTag:12];
    UIView* purpleView = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 250, 250)];
    purpleView.backgroundColor = [UIColor purpleColor];
    [superView addSubview:purpleView];
    NSInteger redIndex = [superView.subviews indexOfObject:redView];
    NSInteger purpleIndex = [superView.subviews indexOfObject:purpleView];
    //交换
    [superView exchangeSubviewAtIndex:redIndex withSubviewAtIndex:purpleIndex];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
