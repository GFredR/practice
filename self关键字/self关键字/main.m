//
//  main.m
//  self关键字
//
//  Created by 郭丰锐 on 2017/8/3.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//
/*
 1方法内部可以定义一个和属性名相同的局部变量
 
 */
#import <Foundation/Foundation.h>
#import "Perso.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Perso* p1 = [Perso new];
        p1->_name = @"xiaoming";
        [p1 sayHi];
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
