//
//  main.m
//  快速枚举
//
//  Created by 郭丰锐 on 2017/7/13.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //快速枚举就是循环 循环次数由循环开始确定 由被枚举的集合对象的长度确定
        /*NSArray* dataList = @[@"study",@"eat",@"playgame",@"sleep",@"miss"];
        for (NSString* value in dataList) {
            NSLog(@"%@",value);
        }*/
        //数组的访问
        NSArray* arr = @[@"study",@"eat",@"playgame",@"sleep",@"miss"];
        //下标访问
        arr[0];
        //使用方法访问
        id value = [arr objectAtIndex:2];
        //直接获取最后一个元素
        [arr lastObject];
        //直接获取第一个元素
        [arr firstObject];
        //拼接
        NSArray* newArray = [arr arrayByAddingObject:@"newItem"];
        NSLog(@"newarr:%@",newArray);
        //拼接另一个数组内的全部内容
        newArray = [arr arrayByAddingObjectsFromArray:@[@"1",@"2",@"3"]];
        NSLog(@"newArr:%@",newArray);
        //可变数组
        NSMutableArray* muArr = [[NSMutableArray alloc] initWithCapacity:2];
        [muArr addObject:@"123"];
        [muArr insertObject:@"456" atIndex:1];
        NSLog(@"muarr:%@",muArr);
        [muArr  exchangeObjectAtIndex:0 withObjectAtIndex:1];
        NSLog(@"muarr:%@",muArr);
        [muArr replaceObjectAtIndex:0 withObject:@"dancer"];
        
        Student* s1 = [Student new];
        s1.name = @"dancer";
        Student* s2 = [Student new];
        s2.name = @"dancer";
        [muArr addObject:s1];
        
        NSLog(@"muarr:%@",muArr);
        //默认通过指针相同删除，如果希望根据内容删除，需要重写isEqual方法
        [muArr removeObject:s2];
        NSLog(@"muarr:%@",muArr);
        [muArr removeObjectsInRange:NSMakeRange(0, 2)];
        NSLog(@"muarr:%@",muArr);
        //清空数组
        [muArr removeAllObjects];
        NSLog(@"muarr:%@",muArr);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
