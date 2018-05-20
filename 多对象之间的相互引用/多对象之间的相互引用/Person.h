//
//  Person.h
//  多对象之间的相互引用
//
//  Created by 郭丰锐 on 2017/7/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Weapon;
@interface Person : NSObject

@property(retain, nonatomic)Weapon* weapon;
- (instancetype)initWithWeapon:(Weapon*)weapon;

@end
