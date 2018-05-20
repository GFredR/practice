//
//  DemoButton.m


#import "DemoButton.h"

@interface DemoButton()

@property (nonatomic, assign) IBInspectable  CGFloat rectRadius;

@end


@implementation DemoButton


- (void)setRectRadius:(CGFloat)rectRadius{
    _rectRadius = rectRadius;
    self.layer.cornerRadius = rectRadius;
}

@end
