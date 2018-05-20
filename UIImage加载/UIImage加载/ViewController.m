//
//  ViewController.m
//  UIImage加载
//
//  Created by 郭丰锐 on 2017/7/13.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    /*
     1.应用程序束
     */
    [super viewDidLoad];
    //读取本地文件方式获取图片
    /*NSString* fileName = [[NSBundle mainBundle] pathForResource:@"006xb584ly1fhhes0gowmj315o1jkqmd" ofType:@"jpg"];
    NSData* imageData = [NSData dataWithContentsOfFile:fileName];
    UIImage* image = [UIImage imageWithData:imageData];*/
    //读取图片名的方式获取图片,量大，重复加载不要使用
   // UIImage* image = [UIImage imageNamed:@"006xb584ly1fh9c823ux0j30k00zkte5.jpg"];
    //image = nil;
    //获取网络图片
    /*NSString* urlString = @"";
    NSURL* url = [NSURL URLWithString:urlString];
    NSData* data = [NSData dataWithContentsOfURL:<#(nonnull NSURL *)#>];
    UIImage* image = [UIImage imageWithData:<#(nonnull NSData *)#>];*/
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.frame)-40, CGRectGetWidth(self.view.frame)-40)];
    imageView.image = image;
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
