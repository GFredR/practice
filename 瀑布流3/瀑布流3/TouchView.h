//
//  TouchView.h
//  瀑布流3
//
//  Created by 郭丰锐 on 2018/1/20.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchView : UIControl

@property(strong, nonatomic)UIImage* image;
@property(strong, nonatomic)NSString* tittle;

- (instancetype)initWithFrame:(CGRect)frame tittle:(NSString*)tittle image:(UIImage*)image;
@end
