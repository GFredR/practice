//
//  ThirdViewController.m
//  导航
//
//  Created by 郭丰锐 on 2017/9/15.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ThirdViewController.h"
#import "FourthViewController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor brownColor]];
    //[self.view setBackgroundColor:[UIColor purpleColor]];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
- (void)nextAction:(UIButton*)sender{
    FourthViewController* fourthVC = [[FourthViewController alloc] init];
    [self.navigationController pushViewController:fourthVC animated:YES];
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

@end
