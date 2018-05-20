//
//  SecondViewController.m
//  委托传值
//
//  Created by 郭丰锐 on 2017/10/7.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<secondDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
- (IBAction)registerAction:(id)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"delegate:%p",self.delegate);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerAction:(id)sender {
    [self.delegate finishedRegister:@{@"userName":self.nameField.text,@"passWord":self.passField.text}];
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
}
@end
