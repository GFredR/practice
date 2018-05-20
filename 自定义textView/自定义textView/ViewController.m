//
//  ViewController.m
//  自定义textView
//
//  Created by 郭丰锐 on 2018/1/23.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "PlaceHolder.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PlaceHolder* placeHolderView = [[PlaceHolder alloc] initWithFrame:CGRectMake(10, 30, CGRectGetWidth(self.view.frame)-20, 300)];
    placeHolderView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [placeHolderView setFont:[UIFont systemFontOfSize:25]];
    [placeHolderView setPlaceHolder:@"请输入文字"];
   
    [self.view addSubview:placeHolderView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
