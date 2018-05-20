//
//  ViewController.m
//  NSThread
//
//  Created by 郭丰锐 on 2018/4/11.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)threadTest3{
    //隐式创建
    [self performSelectorInBackground:@selector(handleThread) withObject:nil];
    //    [self performSelector:@selector(handleThread) withObject:nil afterDelay:1];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)threadTest2{
    [NSThread detachNewThreadSelector:@selector(handleThread) toTarget:self withObject:nil];
}
- (void)threadTest{
    NSLog(@"%@",[NSThread currentThread]);
    
    NSLog(@"%@",[NSThread mainThread]);
    //创建线程
    NSThread* thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(handleThread) object:nil];
    //
    thread1.name = @"gfr";
    //优先级
    thread1.threadPriority = 1;
    [thread1 start];

}

- (void)handleThread{
    NSLog(@"%@",[NSThread currentThread]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
