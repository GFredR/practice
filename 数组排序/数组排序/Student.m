//
//  Student.m
//  数组排序
//
//  Created by 郭丰锐 on 2017/7/9.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Student.h"

@implementation Student
- (NSComparisonResult)compareStudent:(Student*)stu{
    if (self.age > stu.age) {
        return NSOrderedDescending;
    }else if (self.age < stu.age){
        return NSOrderedAscending;
    }else{
        return [self.name compare:stu.name];

    }
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@ age%ld", self.name,self.age];
}
@end
