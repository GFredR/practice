//
//  ViewController.m


#import "ViewController.h"
#import "UIView+Animation.h"
#import "DemoButton.h"


#define  kDuration 0.7



@interface ViewController ()
@property (weak, nonatomic) IBOutlet DemoButton *upBtn;
@property (nonatomic ,weak) UIButton *codeB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bounce_up:(UIButton *)sender {
    
  [sender bounceUpWithDuration:kDuration];
}
- (IBAction)bounce_down:(UIButton *)sender {
    [sender bounceDownWithDuration:kDuration];
}
- (IBAction)bounce_left:(UIButton *)sender {
    [sender bounceLeftWithDuration:kDuration];
}
- (IBAction)bounce_right:(UIButton *)sender {
    [sender bounceRightWithDuration:kDuration];
}
- (IBAction)shake:(UIButton *)sender {
    [sender shakeWithDuration:kDuration];
}
- (IBAction)zoomin:(UIButton *)sender {
    [sender zoomInWithDuration:kDuration];
}
- (IBAction)zoomout:(UIButton *)sender {
    [sender zoomOutWithDuration:kDuration];
}
- (IBAction)fadein:(UIButton *)sender {
    [sender fadeInWithDuration:kDuration];
}
- (IBAction)fadeout:(UIButton *)sender {
    [sender fadeOutWithDuration:kDuration];
}
- (IBAction)fadeLeft:(UIButton *)sender {
    [sender fadeoutLeftWithDuration:kDuration];
}
- (IBAction)fadeRight:(UIButton *)sender {
    [sender fadeOutRightWithDuration:kDuration];
}
- (IBAction)bubbleOut:(UIButton *)sender {
    [sender bubbleOutWithDuration:kDuration];
}
- (IBAction)bubble:(UIButton *)sender {
    [sender bubbleWithDuration:kDuration];
}

- (IBAction)slowBubble:(UIButton *)sender {
    [sender slowBubbleWithDuraiton:kDuration];
}
- (IBAction)flash:(UIButton *)sender {
    [sender flashWithDuration:kDuration];
}

- (IBAction)slide:(UIButton *)sender {
    [sender sliderDownWithDuration:kDuration];
}



@end
