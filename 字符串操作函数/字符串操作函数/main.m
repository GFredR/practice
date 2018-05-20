//
//  main.m
//  字符串操作函数
//
//  Created by 郭丰锐 on 2017/7/12.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString* str1 = @"德玛西亚人从不退缩";
        NSUInteger length = [str1 length];
        NSLog(@"length = %lu",length);
        //不能读汉字
        unichar temp = [str1 characterAtIndex:1];
        NSLog(@"temp:%c",temp);
        //不区分大小写比较
        NSString* str2 = @"ABCDEFG";
        NSString* str3 = @"abcdefg";
        NSComparisonResult result = [str2 caseInsensitiveCompare:str3];
        //字符串查找
            //用来描述子串的位置和长度
        NSRange range = {0,10};
        range.location = 1;
        range.length = 5;
        NSRange myRange = NSMakeRange(0, 5);
        NSString* subString = @"bcdef";
        myRange = [str2 rangeOfString:subString];
        NSLog(@"%@",NSStringFromRange(myRange));
        //把一个方法名转化为字符串
        NSString* s = NSStringFromSelector(@selector(length));
        NSLog(@"s:%@",s);
        //把一个Class类型转化为字符串
        s = NSStringFromClass([NSString class]);
        NSLog(@"s:%@",s);
        //字符串前后缀的判断
        NSString* filePath = @"image.png";
        if ([filePath hasSuffix:@".png"]) {
            NSLog(@"png image");
        }else{
            NSLog(@"not png image");
        } //后缀
        if ([filePath hasPrefix:@"image"]) {//前缀
            NSLog(@"yes");
        }else{
            NSLog(@"no");
        }
        //数字转换
        NSString* numString = @"123.5";
        int num1 = [numString intValue];
        NSLog(@"num1%d",num1);
        NSInteger num2 = [numString integerValue];
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
