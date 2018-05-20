//
//  UIView+Animation.m


#import "UIView+Animation.h"
#import <objc/runtime.h>

#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)


@implementation UIView (Animation)

#pragma mark - 💡base Set and Get Method

- (void)setX:(CGFloat)x{
    CGRect temp = self.frame;
    temp.origin.x = x;
    self.frame = temp;
}
- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect temp = self.frame;
    temp.origin.y = y;
    self.frame = temp;
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setHeight:(CGFloat)height{
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame = temp;

}
- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)width{
    CGRect temp = self.frame;
    temp.size.width = width;
    self.frame = temp;

}
- (CGFloat)width{
    return self.frame.size.width;
}

#pragma mark - 💡bounce up
- (void)bounceUpWithDuration:(NSTimeInterval)duration{
    self.transform = CGAffineTransformMakeTranslation(0, -kScreenHeight);
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
        weakSelf.transform = CGAffineTransformMakeTranslation(0, -10);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            weakSelf.transform = CGAffineTransformMakeTranslation(0, 5);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                weakSelf.transform = CGAffineTransformMakeTranslation(0, -2);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    weakSelf.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:nil];
            }];
        }];
    }];
}
#pragma mark - 💡bounce down
- (void)bounceDownWithDuration:(NSTimeInterval)duration{
    self.transform = CGAffineTransformMakeTranslation(0, kScreenHeight);
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
        weakSelf.transform = CGAffineTransformMakeTranslation(0, 10);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            weakSelf.transform = CGAffineTransformMakeTranslation(0, -5);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                weakSelf.transform = CGAffineTransformMakeTranslation(0, 2);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    weakSelf.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:nil];
            }];
        }];
    }];
}
#pragma mark - 💡bounce left
- (void)bounceLeftWithDuration:(NSTimeInterval)duration{
    self.transform = CGAffineTransformMakeTranslation(-kScreenWidth, 0);
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
        weakSelf.transform = CGAffineTransformMakeTranslation(10, 0);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            weakSelf.transform = CGAffineTransformMakeTranslation(-5, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                weakSelf.transform = CGAffineTransformMakeTranslation(2, 0);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    weakSelf.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:nil];
            }];
        }];
    }];
    
}
#pragma mark - 💡bounce right
- (void)bounceRightWithDuration:(NSTimeInterval)duration{
    self.transform = CGAffineTransformMakeTranslation(kScreenWidth, 0);
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
        weakSelf.transform = CGAffineTransformMakeTranslation(-10, 0);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            weakSelf.transform = CGAffineTransformMakeTranslation(5, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                weakSelf.transform = CGAffineTransformMakeTranslation(-2, 0);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    weakSelf.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:nil];
            }];
        }];
    }];
}
#pragma mark - 💡slow bubble
- (void)slowBubbleWithDuraiton:(NSTimeInterval)duration{
    self.transform = CGAffineTransformMakeScale(1, 1);
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
        weakSelf.transform = CGAffineTransformMakeScale(1, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            weakSelf.transform = CGAffineTransformMakeScale(1.2, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                weakSelf.transform = CGAffineTransformMakeScale(0.9, 0.9);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    weakSelf.transform = CGAffineTransformMakeScale(1, 1);
                } completion:nil];
            }];
        }];
    }];
}

#pragma mark - 💡flash
- (void)flashWithDuration:(NSTimeInterval)duration{
    self.alpha = 0;
    [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
    self.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
            self.alpha = 1;
            } completion:nil];
        }];
    }];
}
#pragma mark - 💡bubble out
- (void)bubbleOutWithDuration:(NSTimeInterval)duration{
    self.transform = CGAffineTransformMakeScale(1, 1);
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
        weakSelf.alpha = 1;
        weakSelf.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
            weakSelf.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
                weakSelf.transform = CGAffineTransformMakeScale(1, 1);
                weakSelf.alpha = 0;
            } completion:nil];
        }];
    }];
}
#pragma mark - 💡bubble
- (void)bubbleWithDuration:(NSTimeInterval)duration{
    self.alpha = 0;
    self.transform = CGAffineTransformMakeScale(1, 1);
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
        weakSelf.alpha = 1;
        weakSelf.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
            weakSelf.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
                weakSelf.transform = CGAffineTransformMakeScale(1, 1);
            } completion:nil];
        }];
    }];
}
#pragma mark - 💡fade out to left
- (void)fadeoutLeftWithDuration:(NSTimeInterval)duration{
    self.alpha = 1;
    self.transform = CGAffineTransformMakeTranslation(0, 0);
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeTranslation(-kScreenWidth, 0);
    } completion:nil];
}
#pragma mark - 💡fade out to right
- (void)fadeOutRightWithDuration:(NSTimeInterval)duration{
    self.alpha = 1;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeTranslation(kScreenWidth, 0);
    } completion:nil];
}
#pragma mark - 💡fade out
- (void)fadeOutWithDuration:(NSTimeInterval)duration{
    self.alpha = 1;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
    self.alpha = 0;
    } completion:nil];
}
#pragma mark - 💡fade in
- (void)fadeInWithDuration:(NSTimeInterval)duration{
    self.alpha = 0;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        self.alpha = 1;
    } completion:nil];
}
#pragma mark - 💡slider down
- (void)sliderDownWithDuration:(NSTimeInterval)duration{
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, kScreenHeight);
    } completion:nil];
}
#pragma mark - 💡slider up
- (void)sliderUpWithDuration:(NSTimeInterval)duration{
    //self.transform = CGAffineTransformMakeTranslation(0, 0);
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        weakSelf.transform = CGAffineTransformMakeTranslation(0, -kScreenHeight);
    } completion:nil];
}
#pragma mark - 💡zoom out
- (void) zoomOutWithDuration:(NSTimeInterval)duration{
    self.alpha = 0;
    __weak typeof(self) weakSelf = self;
   self.transform = CGAffineTransformMakeScale(2, 2);
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        weakSelf.transform = CGAffineTransformMakeScale(1, 1);
        weakSelf.alpha = 1;
    } completion:nil];
}
#pragma mark - 💡zoom in
- (void) zoomInWithDuration:(NSTimeInterval)duration {
    self.alpha = 1;
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration delay:0 options:0 animations:^{
        // End
        weakSelf.transform = CGAffineTransformMakeScale(2, 2);
        weakSelf.alpha = 0;
    } completion:nil];
}
#pragma mark - 💡shake
- (void)shakeWithDuration:(NSTimeInterval)duration{
    self.transform = CGAffineTransformMakeTranslation(0, 0);
    [UIView animateKeyframesWithDuration:duration/5 delay:0 options:0 animations:^{
        self.transform = CGAffineTransformMakeTranslation(30, 0);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/5 delay:0 options:0 animations:^{
            self.transform = CGAffineTransformMakeTranslation(-30, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/5 delay:0 options:0 animations:^{
                self.transform = CGAffineTransformMakeTranslation(15, 0);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/5 delay:0 options:0 animations:^{
                    self.transform = CGAffineTransformMakeTranslation(-15, 0);
                } completion:^(BOOL finished) {
                    [UIView animateKeyframesWithDuration:duration/5 delay:0 options:0 animations:^{
                        self.transform = CGAffineTransformMakeTranslation(0, 0);
                    } completion:nil];
                }];
            }];
        }];
    }];
    
}
@end
