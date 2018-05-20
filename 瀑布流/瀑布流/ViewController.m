//
//  ViewController.m
//  瀑布流
//
//  Created by 郭丰锐 on 2018/1/18.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
#import "DetailViewController.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    TouchView* touchView = [[TouchView alloc] initWithFrame:CGRectMake(100, 100, 100, 150)];
    
    [touchView setTittle:@"new"];
    [touchView setImage:[UIImage imageNamed:@"01.jpg"]];
    NSLog(@"tittle:%@",touchView.tittle);
    [touchView addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:touchView];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchAction:(TouchView*)sender{
    NSLog(@"tittle:%@",sender.tittle);
    DetailViewController* detailVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
