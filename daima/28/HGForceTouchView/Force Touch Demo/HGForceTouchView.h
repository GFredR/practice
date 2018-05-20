//
//  ForceTouchSurface.h


#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@class HGForceTouchView;

@protocol HGForceTouchViewDelegate <NSObject>
- (void)viewDidForceTouched:(HGForceTouchView*)forceTouchView;
@end

@interface HGForceTouchView : UIScrollView
{
    BOOL countPressing;
    NSTimer *mainTimer;
}

@property (strong, nonatomic) CMMotionManager *motionManager;

//@property (nonatomic, retain) UIView *containerView;

@property(nonatomic, assign) id<HGForceTouchViewDelegate> forceTouchDelegate;

@property UITouch *touchPosition;
@property CGFloat lastX, lastY, lastZ, timePressing;

@end


