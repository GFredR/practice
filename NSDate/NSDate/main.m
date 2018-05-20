//
//  main.m
//  NSDate
//
//  Created by 郭丰锐 on 2017/7/11.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //获取当前时间
        NSDate* now = [NSDate date];
        NSLog(@"now %@",now);
        NSDate* myDate = [now dateByAddingTimeInterval:16*60*60];
        NSLog(@"myDate:%@",myDate);
        //计算时间差
        NSTimeInterval interval = [myDate timeIntervalSinceDate:now];
        NSLog(@"%g",interval);
        //距过去
        [NSDate distantPast];
        //很久很久以后
        [NSDate distantFuture];
        //构建时间格式
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        //设计格式
        [dateFormat setDateFormat:@"hh时mm分ss秒"];
        //转换格式
        NSString* dateString = [dateFormat stringFromDate:now];
        NSLog(@"dateString:%@",dateString);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
