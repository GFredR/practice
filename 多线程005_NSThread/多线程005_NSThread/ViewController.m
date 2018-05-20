//
//  ViewController.m
//  多线程005_NSThread
//
//  Created by 郭丰锐 on 2018/1/22.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self threadDemo];
}

- (void)threadDemo{
    NSThread* t = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    //在项目开发中，可以用来查找崩溃原因
    t.name = @"gfr_thread";
    /*
     优先级别：0.0-1.0 默认为0.5
     只是保证CPU调度的可能性
     多线程的目的：将耗时操作放在后台执行
     不要在开发过程中修改优先级
     */
    t.threadPriority = 0.1;
    [t start];
    NSThread* t2 = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    t2.name = @"gfr_thread2";
    t2.threadPriority = 1.0;
    [t2 start];
}

- (void)demo{
    for (int i = 0; i < 20; i++) {
        NSLog(@"%@ %d",[NSThread currentThread],i);
    }
}



@end
