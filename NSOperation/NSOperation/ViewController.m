//
//  ViewController.m
//  NSOperation
//
//  Created by 郭丰锐 on 2018/1/28.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//
/*
 NSOperation:将操作添加到队列
 GCD：将任务添加到队列
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self demo2];
}
- (void)demo2{
    NSOperationQueue* que = [[NSOperationQueue alloc] init];
    for (int i = 0; i< 10; i++) {
        NSInvocationOperation* op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downImage:) object:@(i)];
        [que addOperation:op];
    }
}
- (void)demo1{
    NSInvocationOperation* op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downImage:) object:@"invocation"];
    //[op start];
    //队列
    NSOperationQueue* que = [[NSOperationQueue alloc] init];
    //操作添加到队列
    [que addOperation:op];
}

- (void)downImage:(id)objc{
    NSLog(@"%@ %@",[NSThread currentThread],objc);
}






















@end
