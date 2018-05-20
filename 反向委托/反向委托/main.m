//
//  main.m
//  反向委托
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "GodMan.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GodMan* man = [[GodMan alloc] init];
        [man goAway];
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
