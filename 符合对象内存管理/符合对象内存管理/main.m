//
//  main.m
//  符合对象内存管理
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Weapon.h"
#import "Skill.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Skill* s = [[Skill alloc] init];
        s.name = @"因陀罗之矢";
        Weapon* w = [[Weapon alloc] init];
        w.skill = s;
        Person* p = [[Person alloc] init];
        p.weapon = w;
        [p release];
        [s release];
        [w release];
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
