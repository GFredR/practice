//
//  DownLoad.m
//  iOS的下载
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "DownLoad.h"

@implementation DownLoad
- (void)downLoadWithUrl:(NSString*)url{
    NSLog(@"这里会耗时100秒");
    NSString* message = @"这是下载到的数据";
    [self.delegate finishLoading:message];
}
@end
