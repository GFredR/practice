//
//  ViewController.m
//  复选框按钮
//
//  Created by 郭丰锐 on 2017/8/3.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //手动设定按钮的选中状态
    [btn setSelected:YES];
    //设定normal select 状态的按钮样式
    [btn setFrame:CGRectMake(100, 100, 40, 40)];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_check_off_selected"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_check_on_selected"] forState:UIControlStateSelected];
    
    
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)btnAction:(UIButton*)sender{
    [sender setSelected:!sender.isSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
