//
//  ViewController.m
//  UIImageView
//
//  Created by 郭丰锐 on 2017/7/24.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 100, CGRectGetWidth(self.view.frame)-60, 400)];
    imageView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"img-f4d070561b8ae9243398822adf0a4c9c.jpg"];
    //设定图片的显示状态
    [imageView setContentMode:UIViewContentModeCenter];
    imageView.clipsToBounds = YES;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
