//
//  main.m
//  字符串创建
//
//  Created by 郭丰锐 on 2017/7/12.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //三种形式
        
        NSString* str1 = [NSString stringWithFormat:@"mssmjdhs ksls%d",1234];
        NSString* str2 = [NSString stringWithUTF8String:"c string"];
        NSString* str3 = [NSString stringWithString:str2];
        NSLog(@"str2:%p str3:%p",str2,str3);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
