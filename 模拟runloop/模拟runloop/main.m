//
//  main.m
//  模拟runloop
//
//  Created by 郭丰锐 on 2018/1/25.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 保证程序不退出
 负责监听事件
 如果没有事件发送就会让程序进入休眠状态
 */
void click(int type)
{
    printf("正在执行 %d 的选项功能",type);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        while (YES) {
            
            printf("请输入选项，0表示退出");
            
            int result = -1;
            scanf("%d",&result);
            if (result == 0) {
                break;
            }else
            {
                click(result);
            }
            
        }
        
        
    }
    
    return 0;
}
