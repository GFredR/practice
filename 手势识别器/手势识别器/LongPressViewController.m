//
//  LongPressViewController.m
//  手势识别器
//
//  Created by 郭丰锐 on 2018/1/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()

@end

@implementation LongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer* press = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction:)];
    [press setNumberOfTouchesRequired:1];
    [press setMinimumPressDuration:1];
    [self.view addGestureRecognizer:press];
    // Do any additional setup after loading the view.
}
- (void)longAction:(UILongPressGestureRecognizer*)sender{
    NSLog(@"长按");
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
