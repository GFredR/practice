//
//  main.m
//  内存管理常见问题
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //坏内存（EXC_Bad）野指针
        int* p;
        NSLog(@"*p = %d",*p);
        
        
        //内存泄漏
        //内存管理的黄金法则
        /*
         1.一个对象被 alloc new copy mutablecopy的时候，引用计数自动置为1
         */
        int* p1 = (int*)malloc(sizeof(int));
        *p1 = 19;
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
