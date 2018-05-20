//
//  main.m
//  书签类设计
//
//  Created by 郭丰锐 on 2017/7/7.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCZItemManger.h"
#import "GCZURLItem.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GCZItemManger* manager = [GCZItemManger new];
       // [manager.items addObject:@"item1"];
        //[manager.items addObject:@"item2"];
       /// for (int i=0; i<manager.items.count; i++) {
        //    NSLog(@"items[%d] = %@",i,manager.items[i]);
       // }
        GCZURLItem* item1 = [GCZURLItem new];
        item1.url = @"baidu.com";
        GCZURLItem* item2 = [GCZURLItem new];
        item2.url = @"souhu.com";
        //[manager.items addObject:item1];
        //[manager.items addObject:item2];
        [manager addBookItems:item1];
        [manager addBookItems:item2];
        [manager showBookItems];
        //NSMutableArray* arr=[NSMutableArray new];
       // [arr addObject:@"123"];
       // [arr addObject:@"obj"];
        //arr.count;
        //arr[0];
       // manager.items = arr;
      //  [manager.items addObject:@"item1"];
      //  [manager.items addObject:@"item2"];
       // for (int i=0; i<manager.items.count; i++) {
       //     NSLog(@"items[%d] = %@",i,manager.items[i]);
       // }
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
