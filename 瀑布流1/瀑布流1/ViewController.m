//
//  ViewController.m
//  瀑布流1
//
//  Created by 郭丰锐 on 2018/1/19.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TouchView* touchVC = [[TouchView alloc] initWithFrame:CGRectMake(100, 100, 100, 150) tittle:@"图片" image:[UIImage imageNamed:@"nvnv"]];
    [touchVC setTittle:@"new"];
    [touchVC setImage:[UIImage imageNamed:@"01.jpg"]];
    NSLog(@"");
    [self.view addSubview:touchVC];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
