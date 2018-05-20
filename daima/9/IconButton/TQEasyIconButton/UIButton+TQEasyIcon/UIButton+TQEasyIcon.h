//
//  UIButton+TQEasyIcon.h
//  TestUIButton


#import <UIKit/UIKit.h>

@interface UIButton (TQEasyIcon)

- (void)setIconInLeft;
- (void)setIconInRight;
- (void)setIconInTop;
- (void)setIconInBottom;
- (void)setIconInLeftWithSpacing:(CGFloat)Spacing;
- (void)setIconInRightWithSpacing:(CGFloat)Spacing;
- (void)setIconInTopWithSpacing:(CGFloat)Spacing;
- (void)setIconInBottomWithSpacing:(CGFloat)Spacing;

@end
