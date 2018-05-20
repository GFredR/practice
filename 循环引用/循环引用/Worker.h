//
//  Worker.h
//  循环引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boss.h"
@interface Worker : NSObject
@property(strong, nonatomic)Boss* b;
- (void)earnMeony;

@end
