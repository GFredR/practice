//
//  Person.m
//  反向委托
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)lookAtHome{
    NSString* message =@"房子后面是薄弱点";
    [self.delegate attentionQuestion:message];
    NSInteger money = [self.delegate payMoney];
    NSLog(@"完成看家一次,获取报酬:%ld 传递信息：%@",money,message);
}
@end
