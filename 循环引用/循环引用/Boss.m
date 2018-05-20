//
//  Boss.m
//  循环引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Boss.h"

@implementation Boss
- (void)dealloc
{
    NSLog(@"boss对象被释放了");
}
- (void)wantBuyWood:(NSInteger)number{
    [self.delegate buyWood:number];
}
@end
