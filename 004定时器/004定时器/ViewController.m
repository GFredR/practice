//
//  ViewController.m
//  004定时器
//
//  Created by 郭丰锐 on 2018/1/25.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSTimer* timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    /*
     NSDefaultRunLoopMode:时钟、网络事件
     NSRunLoopCommonModes：用户交互
     */
    
    //加入到运行循环runloop
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)updateTimer{
    static int num = 0;
    NSLog(@"睡会儿");
    [NSThread sleepForTimeInterval:1.0];
    NSLog(@"%@ %d",[NSThread currentThread],num++);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
