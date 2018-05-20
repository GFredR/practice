//
//  ViewController.m
//  当当个人界面
//
//  Created by 郭丰锐 on 2018/3/1.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "TittleBtn.h"
#import "TittleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view setBackgroundColor:[UIColor orangeColor]];
//    TittleBtn* btn = [[TittleBtn alloc] initWithFrame:CGRectMake(100, 100, 100, 60) tittle:@"我发布的" image:[UIImage imageNamed: @"ff_IconQRCode"]];
//    [self.view addSubview:btn];
    
    TittleView* view = [[TittleView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
    [self.view addSubview:view];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
