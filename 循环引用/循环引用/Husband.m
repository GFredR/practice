//
//  Husband.m
//  循环引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Husband.h"

@implementation Husband
- (void)dealloc
{
    NSLog(@"husband对象被释放");
}
@end
