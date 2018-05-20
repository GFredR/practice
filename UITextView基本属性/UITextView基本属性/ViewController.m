//
//  ViewController.m
//  UITextView基本属性
//
//  Created by 郭丰锐 on 2018/1/23.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor cyanColor]];
    UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, CGRectGetWidth(self.view.frame)-20, CGRectGetHeight(self.view.frame)-50)];
    NSError* error = nil;
    textView.text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"file" ofType:@"txt"] encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"error:%@",error);
    }
    textView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    textView.font = [UIFont systemFontOfSize:20];
    textView.delegate = self;
    //scrollView的属性
    [textView setShowsVerticalScrollIndicator:NO];
    [textView setBounces:NO];
    [self.view addSubview:textView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark textViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"text:%@",text);
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}



@end
