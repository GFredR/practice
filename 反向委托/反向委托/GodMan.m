//
//  GodMan.m
//  反向委托
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "GodMan.h"

@implementation GodMan
- (void)goAway{
    Person* xiaoming = [[Person alloc] init];
    //建立委托关系
    xiaoming.delegate = self;
    [xiaoming lookAtHome];
}
#pragma mark- LookHomeDelegate
- (NSInteger)payMoney{
    NSLog(@"神族：支付一百元");
    return 100;
}
- (void)attentionQuestion:(NSString*)message{
    NSLog(@"神族：获取到了小明的信息：%@",message);
}
@end
