//
//  Person.h
//  实验
//
//  Created by 郭丰锐 on 2017/10/16.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic, copy)NSString* name;
@property(nonatomic, assign)NSInteger age;
@property(nonatomic, copy)NSString* sex;
-(void)run;
-(void)read;
-(void)eat;
@end
