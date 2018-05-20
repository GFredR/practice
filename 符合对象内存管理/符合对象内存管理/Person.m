//
//  Person.m
//  符合对象内存管理
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"
#import "Weapon.h"
@implementation Person
//- (void)setWeapon:(Weapon*)weapon{
//    [_weapon retain];
//    [_weapon release];
//    _weapon = [weapon retain];
//}
- (void)dealloc
{
    [self.weapon release];
    NSLog(@"person被释放了");
    [super dealloc];
    
}
@end
