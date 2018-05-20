//
//  ViewController.m
//  多线程002_pthread
//
//  Created by 郭丰锐 on 2018/1/19.
//  Copyright © 2018年 郭丰锐. All rights reserved.
// 在多线程开发中不能相信一次的结果

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self pthreadDemo];
}
- (void)pthreadDemo{
    NSString* str = @"gfr";
    pthread_t threadID;
    int result = pthread_create(&threadID, NULL, &demo, (__bridge void *)(str));
    //参数1是指向线程的指针，去指向他
    //参数2是线程属性设置为null
    //参数3是指向函数的指针
    //传递函数的参数
    //返回值：特别在C语音框架，非常常见 0是正确 非零是错误的
    
    if (result == noErr) {
        NSLog(@"OK");
    }else{
        NSLog(@"error:%d",result);
    }
    
    
    
    
    
    
}
void * demo(void *param){
    NSLog(@"%@,%@",[NSThread currentThread],param);
    return NULL;
}

@end
