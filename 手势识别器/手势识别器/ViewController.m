//
//  ViewController.m
//  手势识别器
//
//  Created by 郭丰锐 on 2018/1/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)btnAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"手势识别器";
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnAction:(id)sender {
    UIButton* btn = sender;
    NSString* btnTittle = btn.currentTitle;
    NSString* className = [NSString stringWithFormat:@"%@ViewController",btnTittle];
    Class myClass = NSClassFromString(className);
    UIViewController* vc = [[myClass alloc] init];
    vc.navigationItem.title = btnTittle;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
