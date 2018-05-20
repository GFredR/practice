//
//  ViewController.m
//  纵向Label
//
//  Created by 郭丰锐 on 2017/7/20.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Vertical.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel* label = [[UILabel alloc] initWithString:@"德玛西亚人从不退缩" width:40];
    CGRect frame = label.frame;
    frame.origin = CGPointMake(10, 100);
    label.frame = frame;
    //[label setFrame:CGRectMake(50, 100, 0, 0)];
    [self.view addSubview:label];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
