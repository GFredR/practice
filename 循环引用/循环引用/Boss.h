//
//  Boss.h
//  循环引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BossDelegate <NSObject>

- (void)buyWood:(NSInteger)number;

@end

@interface Boss : NSObject
@property(weak, nonatomic)id <BossDelegate>delegate;
- (void)wantBuyWood:(NSInteger)number;
@end
