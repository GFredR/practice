//
//  ViewController.m
//  CGContextObject
//
//  Created by YouXianMing on 15/7/2.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "KView.h"

@interface ViewController ()

@property (nonatomic, strong) KView    *kView;
@property (nonatomic, strong) NSTimer  *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.kView                   = [[KView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.kView.center            = self.view.center;
    self.kView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    self.kView.layer.borderWidth = 0.5f;
    [self.view addSubview:self.kView];
        
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(event) userInfo:nil repeats:YES];
}

- (void)event {

    [self.kView setNeedsDisplay];
}

@end
