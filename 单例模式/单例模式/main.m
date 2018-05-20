//
//  main.m
//  单例模式
//
//  Created by 郭丰锐 on 2017/7/9.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student* s1 = [Student sharedStudent];
        s1.name = @"dancer";
        Student* s2 = [Student sharedStudent];
        NSLog(@"s2.name = %@",s2.name);
        NSLog(@"s1:%p s2:%p",s1,s2);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
