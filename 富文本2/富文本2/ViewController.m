//
//  ViewController.m
//  富文本2
//
//  Created by 郭丰锐 on 2017/7/11.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* exmpleString = @"德玛西亚人从不退缩 人在塔在";
    NSMutableAttributedString* muAttriString = [[NSMutableAttributedString alloc] initWithString:exmpleString];
    
    NSRange range1 = [exmpleString rangeOfString:@"德玛西亚人从不退缩"];
    [muAttriString addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"AaQingCong" size:20],NSForegroundColorAttributeName:[UIColor grayColor]} range:range1];
    NSMutableAttributedString* appandString = [[NSMutableAttributedString alloc] initWithString:@"--盖伦" attributes:@{ns:}];
    
    
    //单个键值对设定富文本样式
   /* NSRange range1 = [exmpleString rangeOfString:@"德玛西亚人从不退缩"];
    NSRange range2 = [exmpleString rangeOfString:@"人在塔在"];
    //手动设置属性变化
    [muAttriString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"AaQingCong" size:40] range:range1];
    
    
    [muAttriString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:range2];
    */
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, CGRectGetWidth(self.view.frame), 60)];
    [label setTextAlignment:NSTextAlignmentCenter];
    label.attributedText = muAttriString;
    [self.view addSubview:label];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
