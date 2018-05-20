//
//  main.m
//  自定义对象的写入
//
//  Created by 郭丰锐 on 2017/7/10.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* p1 = [Person personWithName:@"lili" age:18];
        Person* p2 = [Person personWithName:@"mm" age:19];
        Person* p3 = [Person personWithName:@"llkk" age:20];
       // NSArray* arry = @[p1,p2,p3];
        
        NSString* filePath = @"/Users/guofengrui/Desktop/iOS假期练习/自定义对象的写入/自定义对象的写入/personList.plist";
        //plist只能存放NSString,NSArray,NSDictionary,NSNumber,NSData,NSDate的类型，其他类型只能归档
        //被归档的对象需要遵守nscoding协议然后实现协议里声明的方法
        NSData* data1 = [NSKeyedArchiver archivedDataWithRootObject:p1];
        NSData* data2 = [NSKeyedArchiver archivedDataWithRootObject:p2];
        NSData* data3 = [NSKeyedArchiver archivedDataWithRootObject:p3];
        NSArray* arry = @[data1,data2,data3];
        if([arry writeToFile:filePath atomically:YES]){
            NSLog(@"写入成功");
        }else{
            NSLog(@"写入失败");
        }
        //读取数据
        NSArray* dataArray = [NSArray arrayWithContentsOfFile:filePath];
        for (int i=0; i<dataArray.count; i++) {
            NSData* data = dataArray[i];
            Person* p = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            NSLog(@"%@",p);
        }
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
