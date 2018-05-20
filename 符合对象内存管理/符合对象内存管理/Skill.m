//
//  Skill.m
//  符合对象内存管理
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Skill.h"

@implementation Skill

- (void)dealloc
{
    NSLog(@"skill 被释放了");
    [super dealloc];
}

@end
