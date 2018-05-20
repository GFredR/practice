//
//  Student.h
//  数组排序
//
//  Created by 郭丰锐 on 2017/7/9.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (strong, nonatomic)NSString* name;
@property (assign, nonatomic)NSInteger age;
- (NSComparisonResult)compareStudent:(Student*)stu;
@end
