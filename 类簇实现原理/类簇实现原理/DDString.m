//
//  DDString.m
//  类簇实现原理
//
//  Created by 郭丰锐 on 2017/7/12.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "DDString.h"

@interface AAAString : DDString

@end
@implementation AAAString

- (void)method{
    NSLog(@"form AAA String");
}

@end

@interface BBString : DDString

@end
@implementation BBString

- (void)method{
    NSLog(@"form BB String");
}

@end

@implementation DDString
+ (DDString*)string1{
    DDString* str = [AAAString new];
    return str;
}
+ (DDString*)string2{
    DDString* str = [BBString new];
    return str;
}
//- (void)method;
@end
