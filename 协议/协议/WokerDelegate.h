//
//  WokerDelegate.h
//  协议
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WokerDelegate <NSObject>

//公布一些协议的方法
@required   //必须实现的
-(void)debug;
-(void)code;
@optional   //可选的
-(void)read;

@end
