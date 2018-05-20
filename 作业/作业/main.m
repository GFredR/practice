//
//  main.m
//  作业
//
//  Created by 郭丰锐 on 2017/9/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger oc,java;
        scanf("%ld,%ld",&oc,&java);
        if (oc >90&&java>80) {
            NSLog(@"爸爸给奖励");
        }else if (oc==100&&java>70){
            NSLog(@"爸爸奖励");
        }else {
            NSLog(@"不奖励");
        }
        
        /*NSInteger sum = 0;
        for (NSInteger i = 100; i<=200; i++) {
            if (i%3!=0) {
                sum = sum + i;
                
            }
            
        }
        NSLog(@"%ld",sum);
        // insert code here...
        NSLog(@"Hello, World!");*/
    }
    return 0;
}
