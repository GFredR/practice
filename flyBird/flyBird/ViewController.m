//
//  ViewController.m
//  flyBird
//
//  Created by 郭丰锐 on 2017/8/4.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+GIF.h"
@interface ViewController ()

@property(strong, nonatomic) UIImageView* flyBirds;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createControl];
    
    // Do any additional setup after loading the view, typically from a nib.
}
//懒加载 重写你的get方法
- (UIImageView *)flyBirds{
    if (_flyBirds == nil) {
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"flybirds" ofType:@"gif"];
        _flyBirds = [UIImageView imageViewWithGIFFile:filePath frame:CGRectMake(0, 0, 150, 150)];
        _flyBirds.center = self.view.center;
        //先停止动画
        [_flyBirds stopAnimating];
        [self.view addSubview:_flyBirds];
    }
    return _flyBirds;
}
- (void)createControl{
    UIControl* conr = [[UIControl alloc] initWithFrame:self.view.frame];
    [self.view addSubview:conr];
    [conr addTarget:self action:@selector(touchBegan:) forControlEvents:UIControlEventTouchDown];
    [conr addTarget:self action:@selector(touchEnd:) forControlEvents:UIControlEventTouchUpInside];
}
//按下时触发
- (void)touchBegan:(id)sender{
    NSLog(@"开始");
    [self.flyBirds startAnimating];
}
//抬起时触发
- (void)touchEnd:(id)sender{
    NSLog(@"结束");
    [self.flyBirds stopAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
