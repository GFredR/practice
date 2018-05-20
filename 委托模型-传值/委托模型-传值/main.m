//
//  main.m
//  委托模型-传值
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Fox.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person* xiaoming = [[Person alloc] init];
        //设置小明代理对象
        Fox* fox = [[Fox alloc] init];
        xiaoming.delegate = fox;
        [xiaoming lookAtHome];
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
