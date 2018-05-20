//
//  SideViewController.m
//  QQ侧滑逻辑
//
//  Created by 郭丰锐 on 2018/1/14.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "SideViewController.h"
#import "RootViewController.h"
@interface SideViewController ()

- (IBAction)btnAction:(UIButton*)sender;

@end

@implementation SideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAction:(UIButton*)sender {
    self.completeBlock(sender);
}
@end
