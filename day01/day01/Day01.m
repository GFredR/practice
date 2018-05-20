//
//  Day01.m
//  day01
//
//  Created by 郭丰锐 on 2017/7/6.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "Day01.h"

@implementation Day01
- (instancetype)init
{
    self = [super init];
    if (self) {
        _palyer=@"7";
    }
    return self;
}
-(void)messege{
    NSLog(@"player",_palyer);
}
@end
