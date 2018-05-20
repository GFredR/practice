//
//  ViewController.m
//  视图控制器的生命周期
//
//  Created by 郭丰锐 on 2017/9/27.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

#define SXTLog NSLog(@"%s",__func__)
@interface ViewController ()
- (IBAction)nextAction:(id)sender;
@property (nonatomic, strong)SecondViewController* secondVC;
@end

@implementation ViewController
//直接从storyboard加载控制器对象，不会调用初始化方法init(initWithNib...)
//读取xib文件函数
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
    self.secondVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
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
    //self.view = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)nextAction:(id)sender {
    //当控制器被创建的时候，不一定会加载视图
    //[self.view addSubview:self.secondVC.view];
   // [self.view addSubview:self.secondVC.view];
    [self presentViewController:self.secondVC animated:YES completion:^{
        //视图切换完成的回调
    }];
    
}
@end
