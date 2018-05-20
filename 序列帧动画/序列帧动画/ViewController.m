//
//  ViewController.m
//  序列帧动画
//
//  Created by 郭丰锐 on 2017/7/25.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"yawn/cat_zeh0000" ofType:@"jpg"];
    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:filePath]];
    [self.view addSubview:imageView];
    NSMutableArray* imageArr = [NSMutableArray arrayWithCapacity:30];
    for (int i = 0; i<30; i++) {
        NSString* fileName = [NSString stringWithFormat:@"cat_zeh%4.d",i];
        NSString* filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"jpg"];
        UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfFile:filePath]];
        [imageArr addObject:image];
    }
    //设定动画数组（数组内对象必须是UIImage对象）
    [imageView setAnimationImages:imageArr];
    //设定动画持续时间
    [imageView setAnimationDuration:1.5f];
    //设定动画重复次数
    [imageView setAnimationRepeatCount:0];
    //开始动画
    [imageView startAnimating];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
