//
//  PlaceHolder.m
//  自定义textView
//
//  Created by 郭丰锐 on 2018/1/23.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "PlaceHolder.h"

@interface PlaceHolder()
@property (strong, nonatomic)UILabel* placeHolderLabel;

@end

@implementation PlaceHolder

-(UILabel *)placeHolderLabel{
    if (_placeHolderLabel == nil) {
        _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
        [_placeHolderLabel setTextColor:[UIColor darkGrayColor]];
        [_placeHolderLabel setFont:[UIFont systemFontOfSize:17]];
    }
    return _placeHolderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.placeHolderLabel];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeAction:) name:UITextViewTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidBeginEditingAction:) name:UITextViewTextDidBeginEditingNotification object:nil];
    }
    return self;
}
- (void)setFont:(UIFont *)font{
    [super setFont:font];
    [self.placeHolderLabel setFont:font];
    self.placeHolderLabel.frame = CGRectMake(0, 0, self.frame.size.width, font.lineHeight) ;
}
- (void)setPlaceHolder:(NSString*)string{
    self.placeHolderLabel.text = string;
}
- (void)textDidChangeAction:(NSNotification*)sender{
    NSLog(@"%s",__func__);
    if (!self.placeHolderLabel.isHidden) {
        self.placeHolderLabel.hidden = YES;
    }
}
- (void)textViewDidBeginEditingAction:(NSNotification*)sender{
    NSLog(@"%s",__func__);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
