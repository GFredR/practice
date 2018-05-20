//
//  Student.m
//  单例模式
//
//  Created by 郭丰锐 on 2017/7/9.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Student.h"
Student* p = nil;
@implementation Student
+ (Student*) sharedStudent{
    //对象同一时间只被一个线程访问
    @synchronized (self) {
        static Student* s = nil;
        if (s == nil) {
            s = [[Student alloc]init];
        }
        
        return s;
    }
    
}
@end
