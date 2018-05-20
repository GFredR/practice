//
//  Wife.m
//  循环引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Wife.h"

@implementation Wife
- (void)dealloc
{
    NSLog(@"wife对象被释放");
}
@end
