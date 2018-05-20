//
//  Moto.m
//  深拷贝和浅拷贝
//
//  Created by 郭丰锐 on 2017/7/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Moto.h"

@implementation Moto

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.name];
}
#pragma mark- NSCpying
- (id)copyWithZone:(nullable NSZone *)zone{
    Moto* m = [[self class] allocWithZone:zone];
    m.name = self.name;
    return m;
}
@end
