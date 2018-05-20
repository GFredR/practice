//
//  ViewController.m
//  UIFont
//
//  Created by 郭丰锐 on 2017/7/12.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.frame)-40, 50)];
    label.text = @"德玛西亚人从不退缩";
    [label setFont:[UIFont fontWithName:@"sweetly" size:20]];
    [self.view addSubview:label];
    NSArray* familays = [UIFont familyNames];
    //NSLog(@"font1:%@",font1);
    for (NSString* familyName in familays) {
        NSLog(@"familayName:%@",familyName);
        NSArray* fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString* fontName in fontNames) {
            NSLog(@"fontName:%@",fontName);
        }
        
    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
