//
//  ViewController.m
//  GCD-001
//
//  Created by 郭丰锐 on 2018/1/26.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self GCDDemo3];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
/*
 异步执行任务：
    如果任务没有执行完毕，可以不用等待，异步执行下一个任务。具备开启线程的能力，异步通常是多线程的代名词
 */
- (void)GCDDemo3{
    //指定任务的执行方法--异步
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //耗时操作
         NSLog(@"%@",[NSThread currentThread]);
        //更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"更新UI    %@",[NSThread currentThread]);
        });
    });
}
- (void)GCDDemo2{
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    //2定义任务block
    void (^task)()=^{
        NSLog(@"%@",[NSThread currentThread]);
    };
    dispatch_async(q, task);
}

-(void)GCDDemo1{
    //1创建队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    //2定义任务block
    void (^task)()=^{
        NSLog(@"%@",[NSThread currentThread]);
    };
    dispatch_sync(q, task);
    dispatch_sync(q, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    
    
    
    
    
    
    
    
    
    
    
}

@end
