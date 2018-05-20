//
//  MainView.m
//  拼图
//
//  Created by 郭丰锐 on 2018/1/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "PuzzleView.h"
#import "UIImage+cutImage.h"
#import "TouchImageView.h"
#define N 3
#define EMPTYVIEWTAG 998
@implementation PuzzleView
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        //把图片切割开
        self.image = image;
        [self congfigImage];
    }
    return self;
}
- (void)congfigImage{
    for (NSInteger i = 0; i<N; i++) {
        for (NSInteger j = 0; j<N; j++) {
            CGFloat width = self.frame.size.width/N-1;
            CGFloat height = self.frame.size.height/N-1;
            CGRect rect = CGRectMake(j*width, i*height, width-1, height-1);
            UIImage* cutImage = [self.image cutInRectc:rect];
            TouchImageView* imageView = [[TouchImageView alloc] initWithFrame:rect];
            if (i+j != 0) {
                imageView.image = cutImage;
                
            }else{
                imageView.tag = EMPTYVIEWTAG;
            }
            //处理交互
            [imageView addTargget:self action:@selector(pressAction:)];
            [self addSubview:imageView];
        }
    }
}
- (void)pressAction:(TouchImageView*)touchView{
    TouchImageView* emptyView = [self viewWithTag:EMPTYVIEWTAG];
    //判断当前选中图片是否和空白的图片相邻
    //如果横向相邻
    CGFloat seekY = fabs(emptyView.center.y - touchView.center.y);
    CGFloat seekX = fabs(emptyView.center.x - touchView.center.x);
    CGFloat width = self.frame.size.width/N-1;
    CGFloat height = self.frame.size.height/N-1;
    if ((seekY < 0.01 && seekX < width+1) || (seekX < 0.01 && seekY < height+1)) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = emptyView.frame;
            emptyView.frame = touchView.frame;
            touchView.frame = frame;
        }];
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
