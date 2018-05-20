//
//  ViewController.m
//  NSValue&NSNumber
//
//  Created by 郭丰锐 on 2018/1/23.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNumber* num = [NSNumber numberWithInt:9];
    CGFloat fnum = [num floatValue];
    NSLog(@"fNum = %g",fnum);
    int a = 9;
    NSValue* value = [[NSValue alloc] initWithBytes:&a objCType:@encode(int) ];
    NSError* error = nil;
    int temp = 0;
    [value getValue:&temp];
    NSLog(@"temp = %d",temp);
    NSValue* value1 = [NSValue valueWithCGPoint:CGPointMake(9, 19)];
    CGPoint myPoint;
    [value1 getValue:&myPoint];
    NSLog(@"%@",NSStringFromCGPoint(myPoint));
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
