//
//  Person.h
//  深拷贝和浅拷贝
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Moto;
@interface Person : NSObject<NSCopying>

@property(strong, nonatomic)NSString* name;
@property(assign, nonatomic)NSInteger age;
@property(strong, nonatomic)Moto* moto;
+ (instancetype)personWithName:(NSString*)name age:(NSInteger)age;

@end
