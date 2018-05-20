//
//  CircleTransitionAnimator.h
//  花样页面切换🌻

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CircleTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,weak) id<UIViewControllerContextTransitioning>   transitionContext ;

@end
