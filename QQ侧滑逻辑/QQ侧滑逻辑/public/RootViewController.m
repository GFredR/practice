//
//  RootViewController.m
//  QQ侧滑逻辑
//
//  Created by 郭丰锐 on 2018/1/14.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "RootViewController.h"
#import "SideViewController.h"
#import "TouchView.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define DISTANCE 300
#import "FirstDetailViewController.h"
@interface RootViewController ()
@property(strong, nonatomic)SideViewController* sideVC;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication].keyWindow addSubview:self.sideVC.view];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(sideAction:)];
    // Do any additional setup after loading the view.
}
- (void)sideAction:(id)sender{
    //处理侧滑逻辑
   
    TouchView* touchView = [[TouchView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    touchView.backgroundColor = [UIColor clearColor];
    [self.tabBarController.view addSubview:touchView];
    [touchView addTarget:self action:@selector(hideSideAction:) forControlEvents:UIControlEventTouchUpInside];
    self.sideVC.completeBlock = ^(UIButton* btn){
        if ([btn.currentTitle isEqualToString:@"QQ钱包"]) {
            FirstDetailViewController* detail = [[FirstDetailViewController alloc]init];
            [self hideSideAction:nil];
            [self.navigationController pushViewController:detail animated:YES];
        }
    };
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.tabBarController.view.frame;
        CGRect sideFrame = self.sideVC.view.frame;
        if (frame.origin.x == 0) {
            frame.origin.x += DISTANCE;
            sideFrame.origin.x += DISTANCE;
        }
        self.sideVC.view.frame = sideFrame;
        self.tabBarController.view.frame = frame;
    }];
}
- (void)hideSideAction:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.tabBarController.view.frame;
        CGRect sideFrame = self.sideVC.view.frame;
        if (frame.origin.x == DISTANCE) {
            frame.origin.x -= DISTANCE;
            sideFrame.origin.x -= DISTANCE;
        }
        
        self.sideVC.view.frame = sideFrame;
        self.tabBarController.view.frame = frame;
    }];
    [self.tabBarController.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isMemberOfClass:[TouchView class]]) {
            [obj removeFromSuperview];
        }
    }];
    
}
- (SideViewController*)sideVC{
    if (_sideVC == nil) {
        _sideVC = [[SideViewController alloc] init];
        _sideVC.view.frame = CGRectMake(-SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT);
        
    }
    return _sideVC;
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
