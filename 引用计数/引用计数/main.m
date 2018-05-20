//
//  main.m
//  引用计数
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ////内存管理的黄金法则
        /*
         1.一个对象被 alloc new copy mutablecopy的时候，引用计数自动置为1
         2.如果想持有一个对象的使用权，可以使用retain消息给对象的引用计数+1
         3.如果想释放一个对象的使用权，可以使用release消息，释放引用计数-1
         4.当一个对象的引用计数为0时，自动调用dealloc方法释放对象
         */
        //arc环境下不能使用retainCount
        //不要使用retainCount查看Foundation框架的类，因为不准确
        /*NSMutableString* str = [[NSMutableString alloc] initWithUTF8String:"dancer"];//1
        NSMutableString* str2 = [NSMutableString new];
        NSString* str3 = [str copy];//1
        NSMutableString* str4 = [str mutableCopy];//1
        NSLog(@"%ld %ld %ld %ld",[str retainCount],[str2 retainCount],[str3 retainCount],[str4 retainCount]);*/
        Person* p1 = [[Person alloc] init];
        Person* p2 = [Person new];
        Person* p3 = [p1 copy];
       // Person* p3 = [p1 mutableCopy];
        NSLog(@"%ld %ld %ld",[p1 retainCount],[p2 retainCount],[p3 retainCount]);
        Person* p4 = [p4 retain];
        NSLog(@"%ld",[p1 retainCount]);
        
        [p1 release];
        NSLog(@"p1:%ld",[p1 retainCount]);
        //永远不要手动调用dealloc方法
        //当一个对象的引用计数为0时，不要使用retainCount查看
        NSLog(@"p1:%ld",[p1 retainCount]);
        
        [p1 release];
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
