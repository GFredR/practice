//
//  Person.m
//  多态
//
//  Created by 郭丰锐 on 2017/7/9.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)makeStatmentWithWord:(NSString*)word{
    NSLog(@"此方法应该有子类");
}
@end
