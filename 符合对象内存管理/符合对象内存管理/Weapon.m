//
//  Weapon.m
//  符合对象内存管理
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Weapon.h"

@implementation Weapon
- (void)dealloc
{
    //[self.skill release];
    self.skill = nil;//指针置空
    NSLog(@"weapon被释放了");
    [super dealloc];
}
@end
