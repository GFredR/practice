//
//  ViewController.m
//  多线程第二天NSThread分类
//
//  Created by 郭丰锐 on 2018/1/25.
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
    NSThread* t = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];
    [t start];
    [self performSelector:@selector(otherMethod) onThread:t withObject:nil waitUntilDone:NO modes:nil];
}

-(void)demo{
    NSLog(@"demo------%@",[NSThread currentThread]);
    NSLog(@"哈哈哈哈");
}

-(void)otherMethod{
    for (int i = 0; i<10; i++) {
        NSLog(@"other------%@",[NSThread currentThread]);
    }
}


@end
