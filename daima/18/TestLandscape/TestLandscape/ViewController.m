//
//  ViewController.m
//  TestLandscape
//


#import "ViewController.h"
#import "LandscapeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"横屏测试";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}
//打开一个横屏界面
- (IBAction)openLandscapeControl:(id)sender {
    LandscapeViewController *control = [[LandscapeViewController alloc]initWithNibName:@"LandscapeViewController" bundle:nil];
    
    [self.navigationController pushViewController:control animated:YES];
}


@end
