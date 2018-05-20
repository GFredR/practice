//
//  Weapon.h
//  符合对象内存管理
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Skill;
@interface Weapon : NSObject

@property(retain, nonatomic)Skill* skill;

@end
