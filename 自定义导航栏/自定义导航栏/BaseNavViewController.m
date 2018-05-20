//
//  BaseNavViewController.m
//  自定义导航栏
//
//  Created by 郭丰锐 on 2017/10/29.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController
//类初始化的一个方法
+ (void)initialize{
    //导航栏 UINavgationBar
    UINavigationBar* bar = [UINavigationBar appearance];
    [bar setBarTintColor:[UIColor greenColor]];
    //组件 UIBarButtonItem
    UIBarButtonItem* item = [UIBarButtonItem appearance];
    
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25],NSForegroundColorAttributeName:[UIColor magentaColor]} forState:UIControlStateNormal];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //设定返回按钮样式
    if (self.viewControllers.count) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_backItem"] forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(0, 0, 30, 30)];
        [btn addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    
    [super pushViewController:viewController animated:YES];
    
}
- (void)popAction:(UIButton*)btn{
    [self popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
