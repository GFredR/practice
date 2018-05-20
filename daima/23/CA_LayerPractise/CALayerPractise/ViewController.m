//
//  ViewController.m


#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DelegateView.h"

@interface ViewController ()

@property (strong, nonatomic) DelegateView *delegateView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setImage];
}

- (void)setImage
{
    UIImage *image = [UIImage imageNamed:@"pushing"];
    self.view.layer.contentsScale = [[UIScreen mainScreen] scale];
    self.view.layer.contentsGravity = kCAGravityCenter;
    self.view.layer.contents = (id)[image CGImage];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performFlip)];
    [self.view addGestureRecognizer:tap];
}

- (void)performFlip
{
    self.delegateView = [[DelegateView alloc] initWithFrame:self.view.frame];
    [UIView transitionFromView:self.view toView:self.delegateView duration:1 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(performFlipBack)];
    [self.delegateView addGestureRecognizer:tap];
}

- (void)performFlipBack
{
    [UIView transitionFromView:self.delegateView toView:self.view duration:1 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
}

@end
