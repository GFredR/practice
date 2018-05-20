//
//  Person.m
//  有参数的构造方法
//
//  Created by 郭丰锐 on 2017/7/6.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithMll:(NSString*)name :(NSInteger)age{
    self = [super init];
    if (self) {
        NSLog(@"zdy");
        _name=name;
        _age=age;
    }
    return self;
}
@end
