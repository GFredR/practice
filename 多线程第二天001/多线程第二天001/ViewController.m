//
//  ViewController.m
//  多线程第二天001
//
//  Created by 郭丰锐 on 2018/1/24.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign, atomic)int tickets;

@property (strong, nonatomic)NSObject* lockObj;
@property (atomic, strong)NSObject* myAtomic;
@end
/*
 原子属性：如果不写atomic，多线程写入时，保证同一时间只有一个线程能够写入操作,单（线程）写 多（线程）读技术。
 线程安全：多个线程操作数据，仍能保证数据正确
 实际上，原子属性内部会有一把锁；自旋锁
 共同点：同一时间，只有一个线程访问
 不同点：
    互斥锁：如果发现其他线程正在执行锁定的代码，线程就会进入休眠状态，等待线程完成，就唤醒。
    自旋锁：如果发现其他线程正在执行锁定的代码，线程就会进入死循环模式，等待线程完成，就执行锁定代码。
 */

@implementation ViewController
@synthesize myAtomic = _myAtomic;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSData* data;
    [data writeToFile:@"GFR" atomically:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSObject *)myAtomic{
    return _myAtomic;
}

- (void)setMyAtomic:(NSObject *)myAtomic{
    @synchronized(self){
        _myAtomic = myAtomic;
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.tickets = 20;
    
    NSThread* t1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickets) object:nil];
    t1.name = @"售票员A";
    [t1 start];
    NSThread* t2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickets) object:nil];
    t2.name = @"售票员B";
    [t2 start];
}

- (void)saleTickets{
    
    while (YES) {
        [NSThread sleepForTimeInterval:1.0];
        /*
         互斥锁：保证锁内代码，同一时间只有一个线程执行
         互斥锁的范围：尽量要小，范围大效率就差
         */
        @synchronized(self){
            if (self.tickets > 0) {
                self.tickets--;
                NSLog(@"剩下%d张票 %@",self.tickets,[NSThread currentThread]);
            }else{
                NSLog(@"卖完了");
                break;
            }
        }
        
        
    }
    
}















@end

