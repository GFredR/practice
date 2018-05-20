//
//  main.m
//  练习
//
//  Created by 郭丰锐 on 2017/5/13.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface person : NSObject{
    CGFloat _weight;
}

@end
@implementation person

//

@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        person *p=[person new];
        //[p release];手动管理内存，但需要调整工程设置
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
