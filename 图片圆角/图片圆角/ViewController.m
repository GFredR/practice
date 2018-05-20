//
//  ViewController.m
//  图片圆角
//
//  Created by 郭丰锐 on 2017/7/19.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //普通视图边框、圆角设置
    /*UIView* redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:redView];
    redView.layer.cornerRadius = 20;
    redView.layer.borderWidth = 5.0;
    redView.layer.borderColor = [UIColor cyanColor].CGColor;*/
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    UIImage* image = [UIImage imageNamed:@"img-f79df51bbcf9b111a16bd115a20cca43.jpg"];
    imageView.image = image;
   // [imageView setContentMode:UIViewContentModeTop];
    [self.view addSubview:imageView];
    imageView.layer.cornerRadius = 150;
    imageView.layer.borderColor = [UIColor cyanColor].CGColor;
    imageView.layer.borderWidth = 5.0;
    imageView.clipsToBounds = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
