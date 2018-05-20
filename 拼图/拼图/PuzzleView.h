//
//  MainView.h
//  拼图
//
//  Created by 郭丰锐 on 2018/1/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PuzzleView : UIView
@property (strong, nonatomic)UIImage* image;
//可以实现N*N格
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image;
@end
