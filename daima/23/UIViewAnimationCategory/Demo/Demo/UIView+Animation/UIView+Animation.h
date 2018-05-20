//
//  UIView+Animation.h


#import <UIKit/UIKit.h>

@interface UIView (Animation)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;


/**
 *  上部弹入
 *
 *  @param duration 用时(秒)
 */
- (void)bounceUpWithDuration:(NSTimeInterval)duration;
/**
 *  下部弹入
 *
 *  @param duration 用时(秒)
 */
- (void)bounceDownWithDuration:(NSTimeInterval)duration;
/**
 *  左侧弹入
 *
 *  @param duration 用时(秒)
 */
- (void)bounceLeftWithDuration:(NSTimeInterval)duration;

/**
 *  右侧弹入
 *
 *  @param duration 用时(秒)
 */
- (void)bounceRightWithDuration:(NSTimeInterval)duration;

/**
 *  缓慢变化(建议使用圆形图片)
 *
 *  @param duration 用时(秒)
 */
- (void)slowBubbleWithDuraiton:(NSTimeInterval)duration;
/**
 *  闪烁效果
 *
 *  @param duration 用时(秒)
 */
- (void)flashWithDuration:(NSTimeInterval)duration;
/**
 *  气泡消失
 *
 *  @param duration 用时(秒)
 */
- (void)bubbleOutWithDuration:(NSTimeInterval)duration;
/**
 *  气泡效果
 *
 *  @param duration 用时(秒)
 */
- (void)bubbleWithDuration:(NSTimeInterval)duration;
/**
 *  左侧滑出
 *
 *  @param duration 用时(秒)
 */
- (void)fadeoutLeftWithDuration:(NSTimeInterval)duration;
/**
 *  右侧滑出
 *
 *  @param duration 用时(秒)
 */
- (void)fadeOutRightWithDuration:(NSTimeInterval)duration;
/**
 *  熄灭效果
 *
 *  @param duration 用时(秒)
 */
- (void)fadeOutWithDuration:(NSTimeInterval)duration;
/**
 *  闪现效果
 *
 *  @param duration 用时(秒)
 */

- (void)fadeInWithDuration:(NSTimeInterval)duration;
/**
 *  向下滑出
 *
 *  @param duration 用时(秒)
 */
- (void)sliderDownWithDuration:(NSTimeInterval)duration;

/**
 *  向上滑出
 *
 *  @param duration 用时(秒)
 */
- (void)sliderUpWithDuration:(NSTimeInterval)duration;
/**
 *  淡入效果
 *
 *  @param duration 用时(秒)
 */
- (void) zoomOutWithDuration:(NSTimeInterval)duration;
/**
 *  淡出效果
 *
 *  @param duration 用时(秒)
 *  @param delay    延时(秒)
 */
- (void) zoomInWithDuration:(NSTimeInterval)duration;
/**
 *  抖动效果
 *
 *  @param duration 用时(秒)
 */
- (void)shakeWithDuration:(NSTimeInterval)duration;
@end
