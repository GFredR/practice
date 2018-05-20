//
//  main.m
//  可变字典
//
//  Created by 郭丰锐 on 2017/7/13.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableDictionary* muDic = [NSMutableDictionary dictionaryWithCapacity:5];
        //增
        [muDic setObject:@"dancer" forKey:@"name"];
        [muDic setObject:@"18" forKey:@"age"];
        [muDic addEntriesFromDictionary:@{@"address":@"demaxiya"}];
        NSLog(@"dic:%@",muDic);
        //键值对对数
        //muDic.count;
        //删
        [muDic removeObjectForKey:@"name"];
        NSLog(@"dic:%@",muDic);
        //[muDic removeAllObjects];
        //单个元素修改
        [muDic setObject:@"28" forKey:@"age"];
        NSLog(@"dic:%@",muDic);
        //修改整个字典
        [muDic setDictionary:@{@"value1":@"key1"}];
        NSLog(@"dic:%@",muDic);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
