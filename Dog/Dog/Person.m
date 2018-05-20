//
//  Person.m
//  Dog
//
//  Created by 郭丰锐 on 2017/7/14.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"
#import "Dog.h"
@implementation Person
- (void)lookAtHome{
    //Dog* xiaoBai = [[Dog alloc] init];
   // [xiaoBai bark];
    [self.delegate bark];
    NSLog(@"小明成功看住了一次家");
}
@end
