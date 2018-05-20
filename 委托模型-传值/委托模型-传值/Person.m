//
//  Person.m
//  委托模型-传值
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)lookAtHome{
    [self.delegate bark];
    NSLog(@"看家成功");
}
@end
