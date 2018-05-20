//
//  Person.m
//  ARC&MRC
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
//不释放对象，处理一些对象在释放时需要处理的一些工作
- (void)dealloc
{
    //不需要再释放对象了
    //销毁一些媒体资源
    //取消网络请求
    //停止计时器
    NSLog(@"Person 对象被释放了");
}
@end
