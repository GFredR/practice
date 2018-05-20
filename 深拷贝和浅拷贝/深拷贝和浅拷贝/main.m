//
//  main.m
//  深拷贝和浅拷贝
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Moto.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //浅拷贝
        Person* p = [Person personWithName:@"savoki" age:19];
        Person* p2 = p;
        p.name = @"SAVOKI";
        NSLog(@"name:%@",p2.name);
        //深复制
        /*
         copy 不可变
         mutableCopy 可变 拷贝到的副本一定可变
         */
        NSMutableArray* muArr = [[NSMutableArray alloc] initWithArray:@[@"1",@"2",@"3"]];
        NSMutableArray* muArr1 = [muArr copy];
   //     [muArr1 addObject:@"4"];
        NSLog(@"%@",muArr1);
        muArr1 = [@[@"1",@"2"] mutableCopy];
        [muArr1 addObject:@"4"];
        NSLog(@"%@",muArr1);
        //自定义的对象拷贝
        Person* xiaoMing = [Person personWithName:@"xiaoming" age:17];
        Moto* moto= [[Moto alloc] init];
        moto.name = @"蓝魔";
        xiaoMing.moto = moto;
        Person* ming = [xiaoMing copy];
        ming.age = 20;
        NSLog(@"xiaoming:%@",xiaoMing);
        ming.moto.name = @"铁骑";
        NSLog(@"xiaoming:%@",xiaoMing);
        
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
