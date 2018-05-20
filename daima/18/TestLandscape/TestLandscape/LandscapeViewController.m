//
//  LandscapeControlViewController.m
//  TestLandscape


#import "LandscapeViewController.h"

@interface LandscapeViewController ()

@end

@implementation LandscapeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //设置应用程序的状态栏到指定的方向
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight]; 
    //view旋转
    [self.view setTransform:CGAffineTransformMakeRotation(M_PI/2)];

}

-(void)viewWillAppear:(BOOL)animated
{
    //隐藏navigationController
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    //隐藏状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];}

- (void)viewWillDisappear:(BOOL)animated
{
    //显示状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    //显示navigationController
    [self.navigationController setNavigationBarHidden:NO animated:YES];
       
}


//返回前一页
- (IBAction)clickBack:(id)sender {
    //状态栏旋转
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
