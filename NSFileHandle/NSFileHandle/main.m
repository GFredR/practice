//
//  main.m
//  NSFileHandle
//
//  Created by 郭丰锐 on 2017/7/11.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSFileHandle* fh = [NSFileHandle fileHandleForWritingAtPath:@"/Users/guofengrui/Desktop/myfiles/myfile2.c"];
        //把一个字符串对象转为data对象
        NSData* data = [@"hello" dataUsingEncoding:NSUTF8StringEncoding];
        [fh writeData:data];
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
