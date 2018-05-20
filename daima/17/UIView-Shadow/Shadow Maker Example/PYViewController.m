//
//  PYViewController.m
//  Shadow Maker Example


#import "PYViewController.h"
#import "UIView+Shadow.h"

@interface PYViewController ()

@end

@implementation PYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIView *sampleView1 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    [sampleView1 makeInsetShadowWithRadius:5.0 Alpha:0.8];
    [self.view addSubview:sampleView1];
    
    UIView *sampleView2 = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 100, 200)];
    [sampleView2 makeInsetShadowWithRadius:8.0 Color:[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1] Directions:[NSArray arrayWithObjects:@"top", @"bottom", nil]];
    [self.view addSubview:sampleView2];
}

@end
