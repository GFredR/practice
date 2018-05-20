//
//  Person.h
//  Dog
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LookHomeDelegate <NSObject>

- (void)bark;

@end

@interface Person : NSObject
//构建一个指针，用来保存可以帮我看家的所有对象
@property(strong, nonatomic)id<LookHomeDelegate> delegate;
- (void)lookAtHome;
@end
