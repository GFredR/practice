//
//  Person.h
//  委托模型-传值
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LookHomeDelegate <NSObject>

- (void)bark;

@end

@interface Person : NSObject
@property (weak, nonatomic) id delegate;

- (void)lookAtHome;
@end
