//
//  main.m
//  多对象之间的相互引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Weapon.h"
#import "Skill.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Skill* s = [Skill new];
        s.name = @"螺旋丸";
        
        Weapon* w = [[Weapon alloc] init];
        w.skill = s;
        Person* p = [[Person alloc] init];
        p.weapon = w;
        [s release];
        [w release];
        [p release];
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
