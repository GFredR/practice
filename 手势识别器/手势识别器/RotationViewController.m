//
//  RotationViewController.m
//  手势识别器
//
//  Created by 郭丰锐 on 2018/1/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.center = self.view.center;
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    UIRotationGestureRecognizer* rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationAction:)];
    [view addGestureRecognizer:rotation];
    // Do any additional setup after loading the view.
}
- (void)rotationAction:(UIRotationGestureRecognizer*)rote{
    UIView* view = rote.view;
    view.transform = CGAffineTransformRotate(view.transform, rote.rotation);
    
    rote.rotation = 0;
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
