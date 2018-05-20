//
//  main.m
//  block基本语法
//
//  Created by 郭丰锐 on 2017/7/18.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //block(匿名函数)
        //声明、实现、调用
        //可以嵌套定义
        void (^block)();
        void (^block2)(int a);
        int (^block3)(int a, int b);
        block = ^(){
            NSLog(@"这是一个无参数无返回值的block");
        };
        block2 = ^(int a){
            NSLog(@"这是一个有参数无返回值的block a=%d",a);
        };
        block3 = ^(int a, int b){
            return a+b;
        };
        block();
        block2(4);
        int sum = block3(5,6);
        NSLog(@"sum = %d",sum);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
