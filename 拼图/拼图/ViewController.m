//
//  ViewController.m
//  拼图
//
//  Created by 郭丰锐 on 2018/1/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "PuzzleView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* image = [UIImage imageNamed:@"nvnv.jpg"];
    PuzzleView* puzzleView = [[PuzzleView alloc] initWithFrame:CGRectMake(10, 50, CGRectGetWidth(self.view.frame)-20, CGRectGetWidth(self.view.frame)-20) image:image];
    [self.view addSubview:puzzleView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
