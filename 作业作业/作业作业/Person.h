//
//  Person.h
//  作业作业
//
//  Created by 郭丰锐 on 2017/10/17.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic, assign)NSInteger age;
@property(nonatomic, strong)NSString* name;
- (instancetype)init;
@end
