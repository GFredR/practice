//
//  ViewController.m
//  UIPageControl
//
//  Created by 郭丰锐 on 2018/1/17.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPageControl* pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-100, CGRectGetWidth(self.view.frame), 30)];
    pageControl.tag = 99;
    [pageControl setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:pageControl];
    //设定页数
    [pageControl setNumberOfPages:6];
    //设定当前显示页数
    [pageControl setCurrentPage:0];
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    [swipe setDirection:UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipe];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)swipeAction:(UISwipeGestureRecognizer*)swipe{
    //注意
    static NSInteger index = 0;
    index = (index+1)%6;
    //index = (index-1+6)%6;
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft){
        index = (index+1)%6;
        
    }else if(swipe.direction == UISwipeGestureRecognizerDirectionRight){
        index = (index-1+6)%6;
        
    }
    UIPageControl* pageControl = [self.view viewWithTag:99];
    [pageControl setCurrentPage:index];
    NSLog(@"左滑");
}

@end
