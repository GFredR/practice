//
//  ViewController.m
//  多线程004_NSThread
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
- (void)threadDemo{
    //创建线程
    NSThread* t = [[NSThread alloc] initWithTarget:self selector:@selector(threadStatus) object:nil];
    [t start];
}

- (void)threadStatus{
    
    for (int i = 0; i<20; i++) {
        if (i == 8) {
            //阻塞可以加条件
            NSLog(@"睡一睡");
            [NSThread sleepForTimeInterval:2];
        }
        NSLog(@"%@ %d",[NSThread currentThread],i);
        if (i == 15) {
            //一旦强行终止线程，后面的代码都不会执行
            [NSThread exit];
        }
        
    }
    NSLog(@"能来吗");
}
- (void)exitDemo{
    [self performSelectorInBackground:@selector(startMainThread) withObject:nil];
    [NSThread exit];
}
-(void)startMainThread{
    [NSThread sleepForTimeInterval:1.0];
    [[NSThread mainThread]start];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Go!!!!!");
    //杀主线程
    //[NSThread exit];
    [self exitDemo];
}


@end
