//
//  main.m
//  NSString字符串
//
//  Created by 郭丰锐 on 2017/7/21.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //多行字面量
        NSString* string = @"abc"
        @"sss"
        @"sslll";
        NSLog(@"%@",string);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
