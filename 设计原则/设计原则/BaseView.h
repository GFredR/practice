//
//  BaseView.h
//  设计原则
//
//  Created by 郭丰锐 on 2018/1/31.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView
@property(strong,nonatomic)UIButton* btnPrint;
- (void)changeBtnFrame:(CGRect)frame;
@end
