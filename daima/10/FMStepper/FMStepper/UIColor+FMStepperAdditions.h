//
//  UIColor+FMStepperAdditions.h

#import <UIKit/UIKit.h>

/**
 The `FMStepperAdditions` category on `UIColor`.
 */
@interface UIColor (FMStepperAdditions)

/**
 Darken this color by a given factor.
 @param factor should be between 0 and 1. 0 will not darken at all. 1 will darken totally.
 @return A `UIColor` object with the modified color.
 */
- (UIColor *)colorDarkenedByFactor:(CGFloat)factor;

@end
