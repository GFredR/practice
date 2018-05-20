//
//  PinchViewController.m
//  手势识别器
//
//  Created by 郭丰锐 on 2018/1/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.center = self.view.center;
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    UIPinchGestureRecognizer* pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    [view addGestureRecognizer:pinch];
    // Do any additional setup after loading the view.
}
- (void)pinchAction:(UIPinchGestureRecognizer*)pinch{
    CGFloat scale = pinch.scale;
    NSLog(@"%g",scale);
    UIView* view = pinch.view;
    view.transform = CGAffineTransformScale(view.transform, scale, scale);
    pinch.scale = 1;
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
