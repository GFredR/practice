//
//  MCProgressBarView.h
//  MCProgressBarView
//


#import <UIKit/UIKit.h>

@interface MCProgressBarView : UIView

- (id)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage foregroundImage:(UIImage *)foregroundImage;

@property (nonatomic, assign) double progress;

@end
