//
//  main.m
//  数组
//
//  Created by 郭丰锐 on 2017/7/13.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student* s1 = [Student new];
        s1.name = @"dancer";
        NSArray* arr = @[@"1",@"2",@"3",s1];
        NSArray* arr1 = [[NSArray alloc] initWithObjects:@"1",@"2",s1, nil];
        NSArray* maArr = [NSArray arrayWithObjects:@"1",@"2", nil];
        //数组复制
        NSArray* arr2 = [[NSArray alloc] initWithArray:arr];
        [arr2[3] setName:@"DANCER"] ;
        NSLog(@"s1.name:%@",s1.name);
        NSLog(@"name:%@",[arr1[2] name]);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
