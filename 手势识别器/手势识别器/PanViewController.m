//
//  PanViewController.m
//  手势识别器
//
//  Created by 郭丰锐 on 2018/1/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [view addGestureRecognizer:pan];
    // Do any additional setup after loading the view.
}
- (void)panAction:(UIPanGestureRecognizer*)pan{
    //获取手势识别器对象所处的视图
    UIView* view = pan.view;
    CGPoint distance = [pan translationInView:self.view];
    CGPoint center = view.center;
    center.x += distance.y;
    center.y += distance.y;
    view.center = center;
    [pan setTranslation:CGPointZero inView:self.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
