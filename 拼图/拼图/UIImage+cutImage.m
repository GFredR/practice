//
//  UIImage+cutImage.m
//  拼图
//
//  Created by 郭丰锐 on 2018/1/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "UIImage+cutImage.h"

@implementation UIImage (cutImage)
- (UIImage*)cutInRectc:(CGRect)rect{
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    return [UIImage imageWithCGImage:imageRef];
}
@end
