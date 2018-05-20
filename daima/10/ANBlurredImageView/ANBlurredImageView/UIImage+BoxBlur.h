//
//  UIImage+BoxBlur.h
//  LiveBlurView

#import <UIKit/UIKit.h>

@interface UIImage (BoxBlur)

/* blur the current image with a box blur algoritm */
- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur;

/* blur the current image with a box blur algoritm and tint with a color */
- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur withTintColor:(UIColor*)tintColor;

@end
