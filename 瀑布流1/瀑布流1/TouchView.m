//
//  TouchView.m
//  瀑布流1
//
//  Created by 郭丰锐 on 2018/1/19.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TouchView.h"

@interface TouchView()
@property(strong, nonatomic)UIImageView* imageView;
@property(strong, nonatomic)UILabel* label;

@end

@implementation TouchView
-(instancetype)initWithFrame:(CGRect)frame tittle:(NSString*)tittle image:(UIImage*)image{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.image = image;
        [self addSubview:imageView];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame)-20, CGRectGetWidth(frame), 20)];
        [label setFont:[UIFont systemFontOfSize:14]];
        label.backgroundColor = [UIColor cyanColor];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[UIColor blueColor]];
        [self addSubview:label];
        self.label = label;
    }
    return self;
}

-(void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
    NSLog(@"hh");
    
}
-(void)setTittle:(NSString *)tittle{
    _tittle = tittle;
    self.label.text = tittle;
}

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
}
//- (void)
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
