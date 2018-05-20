//
//  main.m
//  NSFileManger
//
//  Created by 郭丰锐 on 2017/7/11.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //创建文件管理对象
        NSFileManager* fm = [NSFileManager defaultManager];
        if ([fm fileExistsAtPath:@"/Users/guofengrui/Desktop/myfile.c"]) {
            NSLog(@"myfile.c存在");
        }else{
            NSLog(@"文件不存在");
        }
        /*NSData* strData = [NSData dataWithBytes:"hello word" length:15];
        //创建文件
        if ([fm createFileAtPath:@"/Users/guofengrui/Desktop/myfile1.c" contents:strData attributes:nil]) {
            NSLog(@"创建myfile1.c成功");
        }else{
            NSLog(@"失败");
        }
        if ([fm createDirectoryAtPath:@"/Users/guofengrui/Desktop/myfiles" withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"成功");
        }else{
            NSLog(@"失败");
        }*/
        //移动文件 全路径
        /*if ([fm moveItemAtPath:@"/Users/guofengrui/Desktop/myfiles/myfile1.c" toPath:@"/Users/guofengrui/Desktop/myfiles/myfile2.c" error:nil]) {
            NSLog(@"成功");
        }else{
            NSLog(@"失败");
        }*/
        //删除文件
        if ([fm removeItemAtPath:@"/Users/guofengrui/Desktop/myfile.c" error:nil]) {
            NSLog(@"成功");
        }else{
            NSLog(@"失败");
        }
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
