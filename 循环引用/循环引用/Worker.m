//
//  Worker.m
//  循环引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Worker.h"
#import "Boss.h"
@implementation Worker
- (void)earnMeony{
    self.b = [Boss new];
   // Worker* w = [Worker new];
    self.b.delegate = self;
    [self.b wantBuyWood:100];
}
- (void)dealloc
{
    NSLog(@"worker被释放了");
}
#pragma mark- BossDelete
- (void)buyWood:(NSInteger)number{
    NSLog(@"老王收到信息：%ld",number);
}
@end
