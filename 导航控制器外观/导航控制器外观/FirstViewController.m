//
//  FirstViewController.m
//  导航控制器外观
//
//  Created by 郭丰锐 on 2017/10/27.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //每一个压栈的控制器对象，都可以设置导航栏的样式
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bg"] forBarMetrics:UIBarMetricsDefault];
    //self.title = @"首页";
    //标准写法
//    self.navigationItem.title = @"首页";
//    UISwitch* btn = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    
   // [self.navigationItem setTitleView:btn];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    //[label setBackgroundColor:[UIColor lightGrayColor]];
    NSString* tittle = @"自定义首页";
    NSAttributedString* atrributeTittle = [[NSAttributedString alloc] initWithString:tittle attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:30],NSForegroundColorAttributeName:[UIColor orangeColor]}];
    [label setAttributedText:atrributeTittle];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    //设定导航栏组件
//    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"text" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    self.navigationItem.leftBarButtonItem = item;
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"main_right_nav"] style:UIBarButtonItemStylePlain target:self action:@selector(nextAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    // Do any additional setup after loading the view.
}
- (void)nextAction:(UIBarButtonItem*)sender{
    SecondViewController* secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
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
