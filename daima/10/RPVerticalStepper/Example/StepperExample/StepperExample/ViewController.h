//
//  ViewController.h


#import <UIKit/UIKit.h>
#import "RPVerticalStepper.h"

@interface ViewController : UIViewController <RPVerticalStepperDelegate>

@property (nonatomic, weak) IBOutlet UILabel *stepperViaDelegateLabel;
@property (nonatomic, weak) IBOutlet RPVerticalStepper *stepperViaDelegate;

@property (nonatomic, weak) IBOutlet UILabel *stepperLabel;
@property (nonatomic, weak) IBOutlet RPVerticalStepper *stepper;

@end
