//
//  main.m
//  多态
//
//  Created by 郭丰锐 on 2017/7/9.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boy.h"
#import "Girl.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Boy* xiaoming = [Boy new];
        Girl* xiaohong = [Girl new];
        [xiaoming makeStatmentWithWord:@"欣欣向荣"];
        [xiaohong makeStatmentWithWord:@"欣欣向荣"];
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
