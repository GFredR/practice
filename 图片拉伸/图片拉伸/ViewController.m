//
//  ViewController.m
//  图片拉伸
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
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    imageView.backgroundColor = [UIColor cyanColor];
    UIEdgeInsets edgeInset = UIEdgeInsetsMake(250, 250, 250, 250);
    //imageView setContentMode:<#(UIViewContentMode)#>
    UIImage* backImage = [UIImage imageNamed:@"img-aa48b6d84f0fc6339beb14691d216b33.jpg"];
    backImage = [backImage resizableImageWithCapInsets:edgeInset resizingMode:UIImageResizingModeStretch];
    imageView.image = backImage;
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
