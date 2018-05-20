//
//  main.m
//  iOS的下载
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstViewControler.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FirstViewControler* firstVC = [[FirstViewControler alloc] init];
        [firstVC loadFirstView];
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
