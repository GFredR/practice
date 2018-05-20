//
//  ViewController.m
//  计算器
//
//  Created by 郭丰锐 on 2017/8/8.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//记录当前用户输入的数字
@property (strong, nonatomic) NSMutableString* resultString;
//记录最近一次的数
@property (assign, nonatomic) CGFloat lastNumber;
//记录最近一次的符号
@property (strong, nonatomic) NSString* lastMark;
@property (weak, nonatomic) IBOutlet UILabel* numberLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSMutableString*)resultString{
    if (_resultString == nil) {
        _resultString = [[NSMutableString alloc] init];
    }
    return _resultString;
}
//数字键盘方法
- (IBAction)numberAction:(UIButton*)sender{
    NSString* currentTittle = sender.currentTitle;
    [self.resultString appendString:currentTittle];
    self.numberLabel.text = self.resultString;
}
//符号键盘方法
- (IBAction)operateAction:(UIButton*)sender{
    
    //在更新lastnumber和lastMark之前运算结果，并保存在lastResult里面
    CGFloat number = 0;
    if (self.resultString.length == 0) {
        //什么都不做
    }else{
        CGFloat secondNumber = [self.resultString floatValue];
        
        if ([self.lastMark isEqualToString:@"+"]) {
            number = secondNumber+self.lastNumber;
            
        }else if ([self.lastMark isEqualToString:@"−"]) {
            number = self.lastNumber-secondNumber;
            
        }else if ([self.lastMark isEqualToString:@"×"]) {
            number = secondNumber*self.lastNumber;
            
        }else if ([self.lastMark isEqualToString:@"÷"]) {
            number = self.lastNumber/secondNumber;
            
        }else{
            number = self.lastNumber;
        }
            self.numberLabel.text = [NSString stringWithFormat:@"%g",number];
    }
    
    self.lastNumber = number;
    self.lastMark = sender.currentTitle;
    //清空上一次字符串
    [self.resultString setString:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
