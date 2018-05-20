//
//  TouchImageView.m
//  拼图
//
//  Created by 郭丰锐 on 2018/1/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TouchImageView.h"

@implementation TouchImageView{
    id _target;
    SEL _action;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [tap setNumberOfTapsRequired:1];
        [tap setNumberOfTouchesRequired:1];
        [self addGestureRecognizer:tap];
    }
    return self;
}
- (void)tapAction:(UITapGestureRecognizer*)sender{
    UIImageView* imageView = (UIImageView*)sender.view;
    if ([_target respondsToSelector:_action]) {
        [_target performSelector:_action withObject:self];
    }
    
}
- (void)addTargget:(id)target action:(SEL)action{
    _action = action;
    _target = target;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
