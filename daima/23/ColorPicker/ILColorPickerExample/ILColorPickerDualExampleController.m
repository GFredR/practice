

#import "ILColorPickerDualExampleController.h"

@implementation ILColorPickerDualExampleController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 建立一个随机颜色
    
    UIColor *c=[UIColor colorWithRed:(arc4random()%100)/100.0f 
                               green:(arc4random()%100)/100.0f
                                blue:(arc4random()%100)/100.0f
                               alpha:1.0];
    
    colorChip.backgroundColor=c;
    colorPicker.color=c;
    huePicker.color=c;
}

#pragma mark - ILSaturationBrightnessPickerDelegate implementation

-(void)colorPicked:(UIColor *)newColor forPicker:(ILSaturationBrightnessPickerView *)picker
{
    colorChip.backgroundColor=newColor;
}

@end
