//
//  Person.m
//  多对象之间的相互引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithWeapon:(Weapon*)weapon{
    self = [super init];
    if (self) {
        self.weapon = weapon;
    }
    return self;
}
- (void)dealloc
{
    [_weapon release];
    NSLog(@"person 对象被释放了");
    [super dealloc];
}
@end
