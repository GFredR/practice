//
//  DownLoad.m
//  block问题
//
//  Created by 郭丰锐 on 2017/7/18.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "DownLoad.h"

@implementation DownLoad
- (void)downLoadWithUrl:(NSString*)urlString complete:(void(^)(NSString* message))success{
    NSString* loadMessage = [NSString stringWithFormat:@"xia%@",urlString];
    success(loadMessage);
}

@end
