//
//  Person.h
//  自定义对象的写入
//
//  Created by 郭丰锐 on 2017/7/10.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property(strong, nonatomic)NSString* name;
@property(assign, nonatomic)NSInteger age;
+ (instancetype)personWithName:(NSString*)name age:(NSInteger)age;
@end
