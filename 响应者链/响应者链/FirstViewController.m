//
//  FirstViewController.m
//  响应者链
//
//  Created by 郭丰锐 on 2018/1/13.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstView.h"
#import "GFRView.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
- (void)loadView{
    [super loadView];
    FirstView* firstV = [[FirstView alloc]init];
    firstV.backgroundColor = [UIColor purpleColor];
    self.view = firstV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    GFRView* view = [[GFRView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@---touchesbegan",self);
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
