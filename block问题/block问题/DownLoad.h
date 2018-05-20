//
//  DownLoad.h
//  block问题
//
//  Created by 郭丰锐 on 2017/7/18.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoad : NSObject
- (void)downLoadWithUrl:(NSString*)urlString complete:(void(^)(NSString* message))success;
@end
