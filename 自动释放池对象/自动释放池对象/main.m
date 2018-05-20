//
//  main.m
//  自动释放池对象
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* p = [Person personWithName:@"savoki"];
        // insert code here...
        NSLog(@"Hello, World!");
    }//自动释放池销毁，会向池内的每一个对象发送一次release消息
    //自动释放池可手动创建，对象会加入到最近的自动释放池
    return 0;
}
