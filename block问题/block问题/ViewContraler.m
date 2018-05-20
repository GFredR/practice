//
//  ViewContraler.m
//  block问题
//
//  Created by 郭丰锐 on 2017/7/18.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewContraler.h"
#import "DownLoad.h"
@implementation ViewContraler
- (void)loadView{
    DownLoad* dl = [DownLoad new];
    [dl downLoadWithUrl:@"www.baidu.com" complete:^(NSString *message) {
        NSLog(@"显示信息：%@",message);
    }];
}
@end
