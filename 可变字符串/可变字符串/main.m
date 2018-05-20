//
//  main.m
//  可变字符串
//
//  Created by 郭丰锐 on 2017/7/12.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSMutableString* muStr1 = [[NSMutableString alloc] initWithCapacity:1];
        NSLog(@"muSrr1:%@",muStr1);
        [muStr1 insertString:@"dancer" atIndex:0];
        NSLog(@"muSrr1:%@",muStr1);
        
        NSString* str1 = @" is ";
        [muStr1 appendString:str1];
        NSLog(@"muSrr1:%@",muStr1);
        [muStr1 appendFormat:@"%s","a Teacher"];
        NSLog(@"muSrr1:%@",muStr1);
        NSString* newStr = [muStr1 stringByAppendingString:@" so good"];
        NSLog(@"muSrr1:%@",newStr);
        [muStr1 setString:@"nothing"];
        NSLog(@"muSrr1:%@",muStr1);
        NSString* bigString = @"德玛西亚人从不退缩";
        NSMutableString* muBigStr = [NSMutableString stringWithString:bigString];
        //可以处理汉字
        [muBigStr deleteCharactersInRange:NSMakeRange(0, 3)];
        NSString* newFilePath = [muBigStr stringByAppendingPathComponent:@"myfile"];
        NSLog(@"muBigStr:%@",muBigStr);
        NSLog(@"newFilePath:%@",newFilePath);
        //字符串的切割
        NSString* filePath = @"sjjs/skskk/pppap/am.png";
        NSArray* components = [filePath componentsSeparatedByString:@"/"];
        NSLog(@"%@",components);
        filePath = [components componentsJoinedByString:@"-"];
        NSLog(@"filePath=%@",filePath);
        NSLog(@"Hello, World!");
    }
    return 0;
}
