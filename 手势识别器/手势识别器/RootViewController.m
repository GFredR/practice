//
//  RootViewController.m
//  手势识别器
//
//  Created by 郭丰锐 on 2018/1/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
- (UIColor*)randomColor{
    CGFloat floarColor = (random()%255+1)/255.0;
    UIColor* color = [UIColor colorWithRed:floarColor green:floarColor blue:floarColor alpha:1];
    return color;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self randomColor];
    // Do any additional setup after loading the view.
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
