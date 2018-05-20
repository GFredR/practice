//
//  main.m
//  瞎练1
//
//  Created by 郭丰锐 on 2017/7/6.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Computer.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Computer* p1=[Computer new];
        [p1 showMessege];
        [p1 setCname:@"kk"];
        [p1 compute];
    }
    return 0;
}
