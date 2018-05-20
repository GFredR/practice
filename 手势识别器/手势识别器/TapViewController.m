//
//  TapViewController.m
//  手势识别器
//
//  Created by 郭丰锐 on 2018/1/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    //设定轻击次数
    [tap setNumberOfTapsRequired:2];//双击事件
    [tap setNumberOfTouchesRequired:2];//设置触摸数量为2
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
-(void)tapAction:(UITapGestureRecognizer*)sender{
    NSLog(@"双击事件被识别");
    
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
