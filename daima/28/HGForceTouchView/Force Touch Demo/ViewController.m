//
//  ViewController.m

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.forceTouchView setForceTouchDelegate:self];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidForceTouched:(HGForceTouchView*)forceTouchView {
    
    for (UIView *views in self.forceTouchView.subviews) {
        [views removeFromSuperview];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [label setText:@"FORCE TOUCHED!"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [self.forceTouchView addSubview:label];
    [self performSelector:@selector(removeFrom) withObject:nil afterDelay:1];
}

- (void)removeFrom {
    for (UIView *views in self.forceTouchView.subviews) {
        [views removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
