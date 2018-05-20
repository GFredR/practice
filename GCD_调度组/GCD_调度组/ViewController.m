//
//  ViewController.m
//  GCD_调度组
//
//  Created by 郭丰锐 on 2018/1/28.
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
    [self gcdDemo2];
}
-(void)gcdDemo2{
    void (^task)() = ^{
        NSLog(@"%@",[NSThread currentThread]);
        dispatch_queue_t t = dispatch_get_main_queue();
        dispatch_sync(t, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
        NSLog(@"哈哈");
    };
    dispatch_async(dispatch_get_global_queue(0, 0), task);
}

-(void)gcdDemo1{
    dispatch_queue_t t = dispatch_get_main_queue();
    //异步
    dispatch_async(t, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    NSLog(@"哈哈");
}


-(void)group1{
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    //调度组
    dispatch_group_t g = dispatch_group_create();
    //添加任务，将队列调度任务。任务完成的时候，能够提醒
    dispatch_group_async(g, q, ^{
        NSLog(@"download A %@",[NSThread currentThread]);
    });
    
    
    dispatch_group_async(g, q, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download b %@",[NSThread currentThread]);
    });
    
    dispatch_group_async(g, q, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download c %@",[NSThread currentThread]);
    });
    
    //任务完成 通知
    dispatch_group_notify(g, q, ^{
        NSLog(@"ok %@",[NSThread currentThread]);
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


@end
