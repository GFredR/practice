//
//  Person.m
//  自定义对象的写入
//
//  Created by 郭丰锐 on 2017/7/10.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (instancetype)personWithName:(NSString*)name age:(NSInteger)age{
    Person* p = [Person new];
    p.name = name;
    p.age = age;
    return p;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@ age:%ld", self.name,self.age];
}
#pragma -mark nscoding
//归档的使用
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
}
//解档的使用
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.age = [aDecoder decodeIntegerForKey:@"age"];
    return self;
}
@end
