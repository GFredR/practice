//
//  main.m
//  沙盒路径
//
//  Created by 郭丰锐 on 2017/7/11.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString* filePath = @"/Users/guofengrui/Desktop/iOS假期练习/沙盒路径/沙盒路径/dataList.plist";
        NSArray* dataArray = [NSArray arrayWithContentsOfFile:filePath];
        for (int i = 0; i<dataArray.count; i++) {
            NSLog(@"dataArray:%@",dataArray[i]);
        }
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
