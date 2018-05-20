//
//  UIImageView+GIF.h
//  test
//
//  Created by dancer on 16/8/24.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (GIF)

// 从指定的路径加载GIF并创建UIImageView
+ (UIImageView *)imageViewWithGIFFile:(NSString *)file frame:(CGRect)frame;

@end
