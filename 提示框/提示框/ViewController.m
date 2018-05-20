//
//  ViewController.m
//  提示框
//
//  Created by 郭丰锐 on 2017/8/1.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建提示框
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示框标题" message:@"提示框的信息" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* alertAction1 = [UIAlertAction actionWithTitle:@"按钮标题" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击按钮出发的方法");
    }];
    UIAlertAction* alertAction2 = [UIAlertAction actionWithTitle:@"取消按钮" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消按钮的方法");
    }];
    [alert addAction:alertAction1];
    [alert addAction:alertAction2];
    //展示提示框
    [self presentViewController:alert animated:YES completion:nil];
    
    
    //alert addAction:<#(nonnull UIAlertAction *)#>
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
