//
//  UIView+Shadow.h
//  Shadow Maker Example
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (Shadow)

- (void) makeInsetShadow;
- (void) makeInsetShadowWithRadius:(float)radius Alpha:(float)alpha;
- (void) makeInsetShadowWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions;

@end
