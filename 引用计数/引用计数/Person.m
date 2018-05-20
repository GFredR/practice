//
//  Person.m
//  引用计数
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    [_book release];
    NSLog(@"对象被释放了");
    [super dealloc];
}
#pragma mark- NSCopying
- (id)copyWithZone:(nullable NSZone *)zone{
    Person* p = [[self class] allocWithZone:zone];
    return p;
}
@end
