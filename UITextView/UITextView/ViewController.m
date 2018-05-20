//
//  ViewController.m
//  UITextView
//
//  Created by 郭丰锐 on 2018/3/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)SwAction:(UISwitch*)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)SwAction:(UISwitch*)sender {
    //获取当前Switch的开关状态
    BOOL isOn = sender.isOn;
    
    if (isOn == YES) {
        self.imageView.image = [UIImage imageNamed:@"img_02.jpg"];
    }else{
        self.imageView.image = [UIImage imageNamed:@"img_01.jpg"];
    }
    
    
}
@end
