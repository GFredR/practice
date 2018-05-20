//
//  main.m
//  字典
//
//  Created by 郭丰锐 on 2017/7/13.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //不可变字典 无序 只能存放对象
        NSDictionary* dic = @{@"key1":@"value1",@"key2":@"value2",@"key3":@"value3",@"key4":@"value4"};
        
        id value = dic[@"key1"];
        NSLog(@"value=%@",value);
        //获取字典所有值和所有键
        NSArray* keys = dic.allKeys;
        NSArray* values = dic.allValues;
        
        for (id value in dic.allValues) {
            NSLog(@"value=%@",value);
        }
        //其他字典构建方法
        NSDictionary* dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"value1",@"key1",@"value2",@"key2",@"value3",@"key3", nil];
        for (id value in dic1.allValues) {
            NSLog(@"value=%@",value);
        }
        NSDictionary* dic2 = [[NSDictionary alloc] initWithContentsOfFile:@"/Users/guofengrui/Desktop/iOS假期练习/字典/字典/dicList.plist"];
        NSLog(@"dic2:%@",dic2);
        NSDictionary* dic3 = [[NSDictionary alloc] initWithObjects:@[@"gfr",@"20",@"haerbin"] forKeys:@[@"name",@"age",@"address"]];
        NSLog(@"dic3:%@",dic3);
        //字典的复制
        NSDictionary* dic4 = [[NSDictionary alloc] initWithDictionary:dic3];
        NSDictionary* dic5 = [[NSDictionary alloc] initWithDictionary:dic3 copyItems:YES];
        //字典的键是否可以重复，不可以，值可以
        NSDictionary* dic6 = [NSDictionary dictionary];
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
