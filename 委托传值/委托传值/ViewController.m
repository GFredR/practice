//
//  ViewController.m
//  委托传值
//
//  Created by 郭丰锐 on 2017/10/6.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameFiled;
@property (weak, nonatomic) IBOutlet UITextField *passFiled;
- (IBAction)registerAction:(id)sender;
- (IBAction)logAction:(id)sender;

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


- (IBAction)registerAction:(id)sender {
    SecondViewController* secondVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [secondVC setCompleteBlock:^(NSDictionary *msgDic) {
        //
    }] ;
    [self presentViewController:secondVC animated:YES completion:^{
        //
    }];
}

- (IBAction)logAction:(id)sender {
    if ([self.nameFiled.text isEqualToString:@"gfr"] && [self.passFiled.text isEqualToString:@"23456"]) {
        NSLog(@"登陆成功");
    }else{
        NSLog(@"登录失败");
    }
}
#pragma mark- secondDelegate
- (void)finishedRegister:(NSDictionary*)msgDic{
    NSString* userName = msgDic[@"userName"];
    NSString* passWord = msgDic[@"password"];
    self.nameFiled.text = userName;
    self.passFiled.text = passWord;
}
@end
