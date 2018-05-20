//
//  DownLoad.h
//  iOS的下载
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownLoadDelegate <NSObject>

- (void)finishLoading:(NSString*)message;

@end

@interface DownLoad : NSObject
@property(weak, nonatomic)id delegate;

- (void)downLoadWithUrl:(NSString*)url;
@end
