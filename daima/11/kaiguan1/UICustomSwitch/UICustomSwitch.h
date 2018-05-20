

#import <UIKit/UIKit.h>

// 该方法时SDK文档中没有的， 添加一个category
@interface UISwitch (extended)
- (void) setAlternateColors:(BOOL) boolean;
@end
// 自定义Slider 类
@interface _UISwitchSlider : UIView
@end


@interface UICustomSwitch : UISwitch {

}
- (void) setLeftLabelText:(NSString *)labelText
                     font:(UIFont*)labelFont
                    color: (UIColor *)labelColor;
- (void) setRightLabelText:(NSString *)labelText
                      font:(UIFont*)labelFont
                     color:(UIColor *)labelColor;
- (UILabel*) createLabelWithText:(NSString*)labelText
                            font:(UIFont*)labelFont
                           color:(UIColor*)labelColor;

@end<!-- WP Super Cache is installed but broken. The path to wp-cache-phase1.php in wp-content/advanced-cache.php must be fixed! -->