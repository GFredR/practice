//
//  main.m
//  Dog
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "BigDog.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* xiaoming = [[Person alloc] init];
        BigDog* bigDog = [[BigDog alloc] init];
        xiaoming.delegate = bigDog;
        [xiaoming lookAtHome];
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
