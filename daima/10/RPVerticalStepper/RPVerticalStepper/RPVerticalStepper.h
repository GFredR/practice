//
//  RPVerticalStepper.h


#import <Foundation/Foundation.h>

@class RPVerticalStepper;
@protocol RPVerticalStepperDelegate <NSObject>
@optional
- (void)stepperValueDidChange:(RPVerticalStepper *)stepper;
@end

@interface RPVerticalStepper : UIControl

@property (nonatomic, weak) id <RPVerticalStepperDelegate> delegate;

@property (nonatomic, assign) CGFloat value;
@property (nonatomic, assign) CGFloat minimumValue;
@property (nonatomic, assign) CGFloat maximumValue;
@property (nonatomic, assign) CGFloat stepValue;
@property (nonatomic, assign) BOOL autoRepeat;
@property (nonatomic, assign) CGFloat autoRepeatInterval;

@end
