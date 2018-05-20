//
//  SecondViewController.m
//  视图控制器的生命周期
//
//  Created by 郭丰锐 on 2017/9/27.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "SecondViewController.h"
#define SXTLog NSLog(@"%s",__func__)
@interface SecondViewController ()
- (IBAction)returnAction:(id)sender;

@end

@implementation SecondViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        SXTLog;
    }
    return self;
}
//读取视图控制器的函数
- (instancetype)init
{
    self = [super init];
    if (self) {
        //可以处理一些与视图无关的初始化
        SXTLog;
    }
    return self;
}
//loadView
- (void)loadView{
    [super loadView];
    SXTLog;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SXTLog;
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    SXTLog;
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    SXTLog;
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    SXTLog;
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    SXTLog;
    
}
- (void)dealloc{
    
    SXTLog;
    self.view = nil;
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

- (IBAction)returnAction:(id)sender {
    //[self.view removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
    
}
@end
