//
//  ViewController.m
//  UIColor详解
//
//  Created by 郭丰锐 on 2017/7/10.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "GloableFile.h"
#import "UIColor+HEX.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor* backColor = [UIColor redColor];
    backColor = [UIColor colorWithRed:30/255.0 green:80/255.0 blue:100/255.0 alpha:1];
    [[UIScreen mainScreen] bounds].size.width;
    backColor = RGBAColr(215, 202, 153, 1);
    //HEX String
    NSString* hexString = @"#16fa4b";
    backColor = [UIColor colorWithHexString:hexString];
    //
    backColor = [backColor colorWithAlphaComponent:0.1];
    //HEX value
    backColor = [UIColor colorWithHex:0x16fa4b];
    //hex 透明度
    backColor = [UIColor colorWithHex:0x16fa4b andAlpha:0.5];
    //设置所有视图对象
    self.view.backgroundColor = backColor;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
