//
//  TittleBtn.m
//  当当个人界面
//
//  Created by 郭丰锐 on 2018/3/1.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TittleBtn.h"

@interface TittleBtn()

@property(strong, nonatomic)UIImageView* imageView;
@property(strong, nonatomic)UILabel* tittleLabel;

@end

@implementation TittleBtn

- (instancetype)initWithFrame:(CGRect)frame tittle:(NSString*)tittle image:(UIImage*)image{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = CGRectGetWidth(frame)/5.0;//
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
        imageView.center = CGPointMake(frame.size.width/2.0, frame.size.height/3.0);
        [imageView setBackgroundColor:[UIColor whiteColor]];
        imageView.image = image;
        
        [self addSubview:imageView];
        
        self.imageView = imageView;
        
        CGFloat labelHeight = CGRectGetHeight(frame)/3.0;
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeight*2, frame.size.width, labelHeight)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[UIColor whiteColor]];
        [label setFont:[UIFont systemFontOfSize:labelHeight-5]];
        label.text = tittle;
        [self addSubview:label];
        
        self.tittleLabel = label;
        
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1;
        
    }
    return self;
}
- (UIImage*)image{
    return self.imageView.image;
}
- (NSString*)tittle{
    return self.tittleLabel.text;
}

//- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
//}














@end
