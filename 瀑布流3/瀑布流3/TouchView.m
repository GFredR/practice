//
//  TouchView.m
//  瀑布流3
//
//  Created by 郭丰锐 on 2018/1/20.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TouchView.h"

@interface TouchView()

@property(strong, nonatomic)UIImageView* imageView;
@property(strong, nonatomic)UILabel* label;
@end

@implementation TouchView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.imageView];
        [self addSubview:self.label];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame tittle:(NSString*)tittle image:(UIImage*)image{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.label];
        self.imageView.image = image;
        self.label.text = tittle;
    }
    return self;
}
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.image = self.image;
        [self addSubview:_imageView];
    }
    return _imageView;
    
}

- (UILabel *)label{
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-20, CGRectGetWidth(self.frame), 20)];
        [_label setFont:[UIFont systemFontOfSize:14]];
        _label.backgroundColor = [UIColor cyanColor];
        [_label setTextColor:[UIColor blueColor]];
        [_label setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_label];
        
    }
    return _label;
}

- (void)setImage:(UIImage *)image{
    _image = image;//保留对象的所有权
    self.imageView.image = image;
    
}

- (void)setTittle:(NSString *)tittle{
    _tittle = tittle;
    self.label.text = tittle;
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
