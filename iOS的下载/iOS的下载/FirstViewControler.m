//
//  FirstViewControler.m
//  iOS的下载
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "FirstViewControler.h"
#import "DownLoad.h"
@implementation FirstViewControler
- (void)loadFirstView{
    //下载数据
    DownLoad* downLoad = [[DownLoad alloc] init];
    downLoad.delegate = self;
    [downLoad downLoadWithUrl:@"www.baidu.com"];
    //展示数据
}
#pragma mark- DownLoadDelegate
- (void)finishLoading:(NSString*)message{
    NSLog(@"下载完成,数据内容如下:\n%@",message);
}
@end
