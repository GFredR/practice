//
//  DetailViewController.m
//  微信发现界面
//
//  Created by 郭丰锐 on 2018/2/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (UIColor*)randomColor{
    return [UIColor colorWithRed:(random()%255+1)/255.0 green:(random()%255+1)/255.0 blue:(random()%255+1)/255.0 alpha:1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [self randomColor];
    
    self.navigationItem.title = self.lastTittle;
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
