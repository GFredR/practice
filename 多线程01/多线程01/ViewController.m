//
//  ViewController.m
//  多线程01
//
//  Created by 郭丰锐 on 2018/1/19.
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
    for (int i = 0; i < 500; i++) {
        //[NSThread currentThread]：判断当前线程是哪一个线程 1是主线程
        NSLog(@"%d %@",i,[NSThread currentThread]);
    }
}


@end
