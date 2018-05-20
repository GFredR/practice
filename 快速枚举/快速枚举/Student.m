//
//  Student.m
//  快速枚举
//
//  Created by 郭丰锐 on 2017/7/13.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Student.h"

@implementation Student
- (BOOL)isEqual:(id)other
{
    if ([other isMemberOfClass:[self class]]) {
        if([self.name isEqualToString: [other name]]){
            return YES;
        }else{
            return NO;
        }
    }
    return NO;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"student:name:%@", self.name];
}
@end
