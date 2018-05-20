//
//  ViewController.m
//  VisualEffectView

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setVisualEffectView];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self snapshot];
}

- (void)setVisualEffectView{
    
    UIView *imgeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"images.png"]];
    
    [imgeView sizeToFit];
    
    imgeView.center = CGPointMake(self.view.bounds.size.width*.5, self.view.bounds.size.height*.5);
    
    [self.view addSubview:imgeView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    button.center = imgeView.center;
    
    //    myView addcon x
    
    /**
     *  UIVisualEffectView
     */
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *bluView = [[UIVisualEffectView alloc]initWithEffect:blur];
    
    bluView.frame = self.view.frame;
    
    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:blur];
    
    UIVisualEffectView *vibView = [[UIVisualEffectView alloc]initWithEffect:vibrancy];
    
    vibView.frame = self.view.frame;
    
    [vibView.contentView addSubview:button];
    
    [bluView.contentView addSubview:vibView];
    
    [self.view addSubview:vibView];

}

/**
 *  快照
 */
- (void)snapshot{
    
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES,1.0);
    
    [self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, nil,NULL, nil);
    
    UIGraphicsEndImageContext();
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
