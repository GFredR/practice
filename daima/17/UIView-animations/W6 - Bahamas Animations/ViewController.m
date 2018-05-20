//
//  ViewController.m
//  W6 - Bahamas Animations


#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewHeightConstraint;

@property (nonatomic) BOOL logInIsOpen;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.logInIsOpen = YES;
    self.plusButton.transform = CGAffineTransformMakeRotation(M_PI_4);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)plusButtonPressed:(UIButton *)sender {
    
    self.logInIsOpen = !self.logInIsOpen;
    
    self.loginViewHeightConstraint.constant = self.logInIsOpen ? 200 : 50;
    
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            [self.view layoutIfNeeded];
        } completion:nil];
    
    
    CGFloat angle = self.logInIsOpen ? M_PI_4 : 0;
    self.plusButton.transform = CGAffineTransformMakeRotation(angle);
    
}

@end
