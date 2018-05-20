//
//  ViewController.m
//  Button Fun


#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ 边的按钮被按下.", title];
    NSMutableAttributedString *styledText = [[NSMutableAttributedString alloc]
                                             initWithString:plainText];
    NSDictionary *attributes =
    @{
      NSFontAttributeName : [UIFont boldSystemFontOfSize:_statusLabel.font.pointSize]
    };
    
    NSRange nameRange = [plainText rangeOfString:title];
    
    [styledText setAttributes:attributes range:nameRange];
    _statusLabel.attributedText = styledText;
}

@end
