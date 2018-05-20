//
//  ViewController.m
//  动态计算Label高度
//
//  Created by 郭丰锐 on 2017/7/13.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* expmelString = @"每个人都会仰赖自己的知识和认识，并被这些东西所束缚着，还将这些东西称为现实。知识和认识是很暧昧的东西，那个现实或许只不过是幻觉，人都活在自己所想象的生活里，不是吗？";
    /*
     prama1 宽度固定 高度足够大的一个CGSize
     */
    
    NSDictionary* attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:30]};
    
    CGRect stringSize = [expmelString boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributeDic context:nil];
    NSLog(@"size:%@",NSStringFromCGRect(stringSize));
    NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:expmelString attributes:attributeDic];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, stringSize.size.height)];
    label.attributedText = attributedString;
    label.numberOfLines = 0;
    [self.view addSubview:label];
        // Do any additional setup after loading the view, typically from a nib.
}
- (void)example1{
    NSString* expmelString = @"每个人都会仰赖自己的知识和认识，并被这些东西所束缚着，还将这些东西称为现实。知识和认识是很暧昧的东西，那个现实或许只不过是幻觉，人都活在自己所想象的生活里，不是吗？";
    NSDictionary* dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
    CGSize labelSize = [expmelString sizeWithAttributes:dic];
    NSAttributedString* attributeString = [[NSAttributedString alloc] initWithString:expmelString attributes:dic];
    
    UILabel* label = [[UILabel alloc] init];
    //把标签绘制到屏幕中心
    label.center = self.view.center;
    //设定label的大小
    label.bounds = (CGRect){CGPointZero,labelSize};
    [self.view addSubview:label];
    label.attributedText = attributeString;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
