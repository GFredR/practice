//
//  ViewController.m
//  R0PageView-OC

#import "ViewController.h"
#import "R0PageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    R0PageView *pageView = [R0PageView pageView];
    NSArray *imagesName = @[@"img_00", @"img_01", @"img_02", @"img_03", @"img_04"];
    pageView.imagesName = imagesName;
    pageView.frame = CGRectMake(35, 30, 300, 130);
    [self.view addSubview:pageView];
}

@end
