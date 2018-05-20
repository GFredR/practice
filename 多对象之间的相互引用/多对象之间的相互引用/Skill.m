//
//  Skill.m
//  多对象之间的相互引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Skill.h"

@implementation Skill
- (void)dealloc
{
    NSLog(@"skil对象被释放了");
    [super dealloc];
}
@end
