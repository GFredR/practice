//
//  ViewController.m
//  多线程003_NSThread
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
    [self threadDeom2];
   
}
- (void)threadDeom3{
    NSLog(@"A----%@",[NSThread currentThread]);
    [self performSelectorInBackground:@selector(demo:) withObject:@"background"];
    NSLog(@"B----%@",[NSThread currentThread]);
}
- (void)threadDeom2{
    NSLog(@"A----%@",[NSThread currentThread]);
    [NSThread detachNewThreadSelector:@selector(demo:) toTarget:self withObject:@"Detach"];
    NSLog(@"B----%@",[NSThread currentThread]);
}
- (void)threadDeom1{
    NSLog(@"A------");
    //创建线程
    NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(demo:) object:@"Thread"];
    
    [thread start];
    for (int i = 0; i<10; i++) {
        NSLog(@"%d",i);
    }
    NSLog(@"B-------");
}
- (void)demo:(id)obj{
    for (int i = 0; i<2; i++) {
        NSLog(@"%@",[NSThread currentThread]);
    }
    
}












@end
