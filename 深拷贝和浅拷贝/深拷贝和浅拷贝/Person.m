//
//  Person.m
//  深拷贝和浅拷贝
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"
#import "Moto.h"
@implementation Person
+ (instancetype)personWithName:(NSString*)name age:(NSInteger)age{
    Person* p = [[Person alloc] init];
    p.name = name;
    p.age = age;
    return p;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@ age:%ld" @"moto:%@", self.name,self.age,self.moto];
}
#pragma mark- NSCopying
//如果持有的是对象类型，也要进行copy操作
- (id)copyWithZone:(nullable NSZone *)zone{
    Person* p = [[self class] allocWithZone:zone];
    p.name = self.name;
    p.age = self.age;
    p.moto = [self.moto copy];//浅复制
    return p;
}
@end
