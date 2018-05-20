//
//  ViewController.m
//  GCD-002
//
//  Created by 郭丰锐 on 2018/1/26.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
/*
 GCD 核心概念: 将任务添加队列,指定任务执行的方法
 -任务
    - 使用block封装
    - block就是一个提前准备好的代码块，需要的时候执行
 -队列
    - 串行队列：一个接一个的执行任务
    - 并发队列：可以同时调度多个任务
 -执行任务函数（任务都需要在线程中执行）
    - 同步：当前指令不完成，不执行下一个
    - 异步：当前指令不完成，可以执行一个任务
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self gcdDemo8];
}

-(void)gcdDemo8{
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    for (int i = 0; i<10; i++) {
        
        dispatch_async(q, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
    }
}

/*
 
 */
#pragma mark 全局队列(本质上是一个并发队列)
-(void)gcdDemo7{
    //全局队列
    /*
     参数
     1：涉及系统适配
     iOS 8.0 服务质量
     QOS_CLASS_USER_INTERACTIVE  用户交互（希望线程快速执行，不要放一些耗时操作）
     QOS_CLASS_USER_INITIATED    用户需要的（不要放一些耗时操作）
     QOS_CLASS_DEFAULT           默认
     QOS_CLASS_UTILITY           使用工具（用来耗时操作）
     QOS_CLASS_BACKGROUND        后台
     QOS_CLASS_UNSPECIFIED       没有指定优先级
     
     
     iOS 7.0 调度优先级
     DISPATCH_QUEUE_PRIORITY_HIGH      高优先级
     DISPATCH_QUEUE_PRIORITY_DEFAULT 0 默认优先级
     DISPATCH_QUEUE_PRIORITY_LOW (-2)  低优先级
     DISPATCH_QUEUE_PRIORITY_BACKGROUND 后台优先级
     
     
     参数2：为未来的保留参数
     
     提示：尤其不要选择BACKGROUND  ，线程执行会慢到令人发指！
     */
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    for (int i = 0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"%@ %d",[NSThread currentThread],i);
        });
       
    }
    NSLog(@"哈哈");
    
    
}
#pragma mark 增强版同步任务
/*
 队列调度多个任务之前，指定一个同步任务，让所有异步任务，等待同步任务执行完成，就是依赖关系
 同步任务就相当于一个锁
 */
-(void)gcdDemo6{
    dispatch_queue_t logIn = dispatch_queue_create("Gfr_gcd", DISPATCH_QUEUE_CONCURRENT);
    void (^task)() = ^{
        //1.登录
        dispatch_sync(logIn, ^{
            NSLog(@"用户登录--%@",[NSThread currentThread]);
        });
        //2.支付
        dispatch_async(logIn, ^{
            NSLog(@"用户支付--%@",[NSThread currentThread]);
        });
        //3.下载
        dispatch_async(logIn, ^{
            NSLog(@"用户下载--%@",[NSThread currentThread]);
        });
        
    };
    dispatch_async(logIn, task);
    
}

/*
 在开发中，通常耗时的操作，放在后台执行，有的时候，任务之间有依赖关系
 例如：登录-》支付
 利用同步任务
 */
#pragma mark 同步任务加强
-(void)gcdDemo5{
    dispatch_queue_t logIn = dispatch_queue_create("Gfr_gcd", DISPATCH_QUEUE_CONCURRENT);
    //1.登录
    dispatch_sync(logIn, ^{
        NSLog(@"用户登录--%@",[NSThread currentThread]);
    });
    //2.支付
    dispatch_async(logIn, ^{
        NSLog(@"用户支付--%@",[NSThread currentThread]);
    });
    //3.下载
    dispatch_async(logIn, ^{
        NSLog(@"用户下载--%@",[NSThread currentThread]);
    });
}

#pragma mark 并发队列，同步执行
-(void)gcdDemo4{
    dispatch_queue_t q = dispatch_queue_create("gfr", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i<10; i++) {
        NSLog(@"%d-----------",i);
        dispatch_sync(q, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
    }
    NSLog(@"哈哈哈哈哈哈哈");
}
#pragma mark 并发队列，异步执行
-(void)gcdDemo3{
    dispatch_queue_t q = dispatch_queue_create("gfr", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i<10; i++) {
        NSLog(@"%d-----------",i);
        dispatch_async(q, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
    }
    NSLog(@"哈哈哈哈哈哈哈");
}

#pragma mark 串行队列，异步执行
- (void)gcdDemo2{
    //1.队列---串行
    dispatch_queue_t q = dispatch_queue_create("gfr", NULL);
    
    //2.异步执行任务
    for (int i = 0; i<10; i++) {
        NSLog(@"%d-----------",i);
        dispatch_async(q, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
    }
    NSLog(@"哈哈哈哈哈哈哈");

}
#pragma mark 串行队列，同步执行
- (void)gcdDemo1{
    //1.队列---串行
    dispatch_queue_t q = dispatch_queue_create("gfr", NULL);
    
    //2.同步执行任务
    dispatch_sync(q, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}






















@end
