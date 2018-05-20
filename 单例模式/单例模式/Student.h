//
//  Student.h
//  单例模式
//
//  Created by 郭丰锐 on 2017/7/9.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property(strong, nonatomic) NSString* name;
+ (Student*) sharedStudent; 
@end
