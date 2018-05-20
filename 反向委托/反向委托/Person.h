//
//  Person.h
//  反向委托
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LookHomeDelegate <NSObject>
//获取报酬的方法
- (NSInteger)payMoney;
- (void)attentionQuestion:(NSString*)message;
@end

@interface Person : NSObject

@property (weak,nonatomic)id<LookHomeDelegate> delegate;

- (void)lookAtHome;
@end
