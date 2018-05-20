//
//  FirstView.m
//  响应者链
//
//  Created by 郭丰锐 on 2018/1/13.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "FirstView.h"

@implementation FirstView
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@---touchbegan",self);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
