//
//  SideViewController.h
//  QQ侧滑逻辑
//
//  Created by 郭丰锐 on 2018/1/14.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideViewController : UIViewController

@property (copy, nonatomic) void(^completeBlock)(UIButton* btn);

@end
