//
//  R0PageView.h
//  R0PageView-OC

#import <UIKit/UIKit.h>

@class R0PageView;

@protocol R0PageViewDelegate <NSObject>

@optional
/**
 *  当被点击时调用，并且可以得到点击页码的下标
 */
- (void)pageViewDidClick:(R0PageView *)pageView atCurrentPage:(NSInteger)currentPage;

@end

@interface R0PageView : UIView

/**
 *  代理属性
 */
@property (weak, nonatomic) id<R0PageViewDelegate> delegate;

/**
 *  图片名称数组，传入之后会自动加载图片
 */
@property (strong, nonatomic) NSArray *imagesName;

/**
 *  当前页小圆点颜色，默认是白色
 */
@property (strong, nonatomic) UIColor *currentIndicatorColor;

/**
 *  其它页小圆点颜色，默认是亮灰色
 */
@property (strong, nonatomic) UIColor *pageIndicatorColor;

/**
 *  定时器执行时间间隔，默认是两秒。如果设置为0，则不自动滚动
 */
@property (assign, nonatomic) NSTimeInterval timerInterval;

/**
 *  返回R0PageView的对象
 */
+ (instancetype)pageView;
@end
