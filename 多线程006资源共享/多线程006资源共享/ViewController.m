//
//  ViewController.m
//  多线程006资源共享
//
//  Created by 郭丰锐 on 2018/1/23.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign, atomic)int tickets;

@property (strong, nonatomic)NSObject* lockObj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData* data;
    [data writeToFile:@"GFR" atomically:YES];
    // Do any additional setup after loading the view, typically from a nib.
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
