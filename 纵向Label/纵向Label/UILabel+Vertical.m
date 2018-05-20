//
//  UILabel+Vertical.m
//  纵向Label
//
//  Created by 郭丰锐 on 2017/7/20.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "UILabel+Vertical.h"

@implementation UILabel (Vertical)

- (instancetype)initWithString:(NSString*)text width:(CGFloat)width{
    self = [super init];
    if (self) {
        //设置行间距
        NSMutableParagraphStyle* pargr = [[NSMutableParagraphStyle alloc] init];
        pargr.lineSpacing = 8;
        //设定label的大小
        
        NSDictionary* attributeDic = @{NSFontAttributeName:[UIFont fontWithName:@"sweetly" size:width],NSParagraphStyleAttributeName:pargr,NSForegroundColorAttributeName:[UIColor cyanColor]};
        CGSize labelSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributeDic context:nil].size;
        //设定大小没有起始点
        self.frame = (CGRect){CGPointZero,labelSize};
        NSAttributedString* str = [[NSAttributedString alloc] initWithString:text attributes:attributeDic];
        self.backgroundColor = [UIColor redColor];
        self.attributedText = str;
        
        self.numberOfLines = 0;
    }
    return self;
}

@end
