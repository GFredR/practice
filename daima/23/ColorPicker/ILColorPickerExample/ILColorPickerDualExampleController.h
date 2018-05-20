

#import <UIKit/UIKit.h>
#import "ILSaturationBrightnessPickerView.h"
#import "ILHuePickerView.h"

@interface ILColorPickerDualExampleController : UIViewController<ILSaturationBrightnessPickerViewDelegate> {
    IBOutlet UIView *colorChip;
    IBOutlet ILSaturationBrightnessPickerView *colorPicker;
    IBOutlet ILHuePickerView *huePicker;
}

@end
