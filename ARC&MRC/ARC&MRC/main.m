//
//  main.m
//  ARC&MRC
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         strong retain(一个对象，但凡至少还有一个strong指针指向他，他就不会被ARC释放)
         weak  assign（weak只能指向对象，不能持有对象的所有权，当他指向的对象被释放时，其自动被置为nil）
         */
        Person* p = [Person new];
        NSLog(@"使用完p了");
        p = nil;
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
