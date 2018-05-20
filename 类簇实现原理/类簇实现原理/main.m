//
//  main.m
//  类簇实现原理
//
//  Created by 郭丰锐 on 2017/7/12.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyString.h"
#import "DDString.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //MyString* str = [MyString new];
        //[str length];
        //NSString* str1 = @"dancer";
       // NSString* str2 = [[NSString alloc] initWithUTF8String:"dancer"];
       // NSLog(@"str1:%@ str2:%@",str1.className,str2.className);
        DDString* str1 = [DDString string1];
        DDString* str2 = [DDString string2];
        [str1 method];
        [str2 method];
        //NSLog(@"str1:%@ str2:%@",str1,str2);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
