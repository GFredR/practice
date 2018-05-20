//
//  main.m
//  循环引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Husband.h"
#import "Wife.h"
#import "Boss.h"
#import "Worker.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*Husband* h = [Husband new];
        Wife* w = [Wife new];
        h.wife = w;
        w.husband = h;*/
        Worker* w = [Worker new];
        [w earnMeony];
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
