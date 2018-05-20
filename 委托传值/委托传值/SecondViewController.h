//
//  SecondViewController.h
//  委托传值
//
//  Created by 郭丰锐 on 2017/10/7.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol secondDelegate <NSObject>
- (void)finishedRegister:(NSDictionary*)msgDic;
@end
@interface SecondViewController : UIViewController

@property(weak, nonatomic) id <secondDelegate> delegate;

@property(copy, nonatomic) void (^completeBlock)(NSDictionary* msgDic);
@end
