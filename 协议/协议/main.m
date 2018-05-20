//
//  main.m
//  协议
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WokerDelegate.h"
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student* s = [[Student alloc] init];
        [s debug];
        [s read];
        //只能修饰限定的协议类型
        id<WokerDelegate> woker = [[NSString alloc] init];
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
