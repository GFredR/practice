//
//  ViewController.m
//  GCD-002-01
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
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self gcdDemo2];
}
#pragma mark 串行队列，异步执行
- (void)gcdDemo2{
    //1.队列---串行
    dispatch_queue_t q = dispatch_queue_create("gfr", NULL);
    
    //2.异步执行任务
    dispatch_async(q, ^{
        NSLog(@"%@",[NSThread currentThread]);
        
    }
#pragma mark 串行队列，同步执行
//                   - (void)gcdDemo1{
//                       //1.队列---串行
//                       dispatch_queue_t q = dispatch_queue_create("gfr", NULL);
//
//                       //2.同步执行任务
//                       dispatch_sync(q, ^{
//                           NSLog(@"%@",[NSThread currentThread]);
//                       });
                   
                   

                   @end
                   @end
                   
