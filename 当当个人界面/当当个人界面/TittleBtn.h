//
//  TittleBtn.h
//  当当个人界面
//
//  Created by 郭丰锐 on 2018/3/1.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TittleBtn : UIControl

- (instancetype)initWithFrame:(CGRect)frame tittle:(NSString*)tittle image:(UIImage*)image;

- (UIImage*)image;
- (NSString*)tittle;
@end
