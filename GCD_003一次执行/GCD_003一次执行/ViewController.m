//
//  ViewController.m
//  GCD_003一次执行
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
    [self testOnce];
}
-(void)testOnce{
    for (int i = 0; i<10; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self once];
        });
    }
}

- (void)once{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"执行了%@",[NSThread currentThread]);
    });
}

@end
