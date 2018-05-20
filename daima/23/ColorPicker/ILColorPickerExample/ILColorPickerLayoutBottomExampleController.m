
#import "ILColorPickerLayoutBottomExampleController.h"


@implementation ILColorPickerLayoutBottomExampleController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Build a random color to show off setting the color on the pickers
    
    UIColor *c=[UIColor colorWithRed:(arc4random()%100)/100.0f 
                               green:(arc4random()%100)/100.0f
                                blue:(arc4random()%100)/100.0f
                               alpha:1.0];
    
    colorChip.backgroundColor=c;
    colorPicker.color=c;
}

#pragma mark - ILColorPickerDelegate

-(void)colorPicked:(UIColor *)color forPicker:(ILColorPickerView *)picker
{
    colorChip.backgroundColor=color;
}

@end
