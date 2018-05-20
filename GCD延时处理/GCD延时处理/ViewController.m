//
//  ViewController.m
//  GCD延时处理
//
//  Created by 郭丰锐 on 2018/1/27.
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
    [self delay];
}

- (void)delay{
    /*
     when
     queue
     block
     */
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    dispatch_after(when, dispatch_queue_create("GFR_GCD", NULL), ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}


@end
