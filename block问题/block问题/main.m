//
//  main.m
//  block问题
//
//  Created by 郭丰锐 on 2017/7/18.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "ViewContraler.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Person* p = [Person new];
        //[p studyComplete:^(NSString* message){
          //  NSLog(@"很累%@",message);
            //return 100;
       // }];
        ViewContraler* vc = [ViewContraler new];
        [vc loadView];
        /*//访问外部变量的问题
        //__block 起到了把一个变量封装为一个结构体，被访问的变量将作为这个结构体的成员，把这个结构体的指针复制到block块内
        
        __block int a = 12;
        static int b = 99;
        void (^block)() = ^(){
            a = 4;
            b = 8;
            NSLog(@"a = %d b=%d",a,b);
        };
        block();*/
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
