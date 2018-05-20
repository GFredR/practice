//
//  PuBuView.m
//  瀑布流3
//
//  Created by 郭丰锐 on 2018/1/22.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "PuBuView.h"

#define KLISTSNUMBER 3

@implementation PuBuView
- (instancetype)initWithFrame:(CGRect)frame view:(NSArray<UIView*>*)viewArray{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width/KLISTSNUMBER;
        CGFloat height = frame.size.height/KLISTSNUMBER;
        NSInteger lineNumber = viewArray.count%KLISTSNUMBER;
        if (viewArray.count%KLISTSNUMBER == 0) {
            lineNumber = lineNumber/KLISTSNUMBER;
        }else{
            lineNumber = lineNumber/KLISTSNUMBER+1;
        }
        NSInteger idnex = 0;
        for (NSInteger i = 0; i < lineNumber; i++) {
            //设定view的frame
            for (NSInteger j = 0; j<KLISTSNUMBER; j++) {
                UIView* view = viewArray[idnex++];
                [view setFrame:CGRectMake(j*width, i*height, width-1, height-1)];
                [self addSubview:view];
            }
        }
        //设定滚动视图内容视图
        [self setContentSize:CGSizeMake(frame.size.width, lineNumber*height)];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
